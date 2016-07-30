class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :comments
  has_many :posts
  has_many :events
  has_many :rsvps
  has_many :rsvped_events, through: :rsvps, source: :event

  has_many :user_city_relations
  has_many :preferred_cities, through: :user_city_relations, source: :city

  has_many :user_region_relations
  has_many :preferred_regions, through: :user_region_relations, source: :region

  devise :omniauthable, :omniauth_providers => [:facebook]

  def full_name
    "#{first_name} #{last_name}"
  end

  def self.from_omniauth(auth)
	  where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
	    user.email = auth.info.email
	    user.password = Devise.friendly_token[0,20]
	    user.username = auth.info.name.downcase.tr(" ", "_")
	    user.first_name = auth.info.name.split(" ")[0]   # assuming the user model has a name
	    user.last_name = auth.info.name.split(" ")[1]   # assuming the user model has a name
	    # user.image = auth.info.image # assuming the user model has an image
	  end
	end

	def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end
end
