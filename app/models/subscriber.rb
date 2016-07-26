class Subscriber < ApplicationRecord
  validates_presence_of :email
  validates_format_of :email, :with => /@/
end
