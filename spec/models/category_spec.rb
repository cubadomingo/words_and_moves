# == Schema Information
#
# Table name: categories
#
#  id   :integer          not null, primary key
#  name :string
#

require 'rails_helper'

RSpec.describe Category, type: :model do
  xit { is_expected.to have_many :posts }
  xit { is_expected.to have_many :events }
end
