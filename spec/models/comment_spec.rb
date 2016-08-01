# == Schema Information
#
# Table name: comments
#
#  id       :integer          not null, primary key
#  body     :string
#  user_id  :integer
#  event_id :integer
#  post_id  :integer
#

require 'rails_helper'

RSpec.describe Comment, type: :model do

end
