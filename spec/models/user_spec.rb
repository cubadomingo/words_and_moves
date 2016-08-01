# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  admin                  :boolean
#  username               :string
#  first_name             :string
#  last_name              :string
#  provider               :string
#  uid                    :string
#

require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Methods" do
    describe ".full_name" do
      it "returns Jason Bateman" do
        user = FactoryGirl.create(:user, first_name: "Jason", last_name: "Bateman")
        expect(user.full_name).to eq("Jason Bateman")
      end
    end
  end
end
