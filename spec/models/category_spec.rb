require 'rails_helper'

RSpec.describe Category, type: :model do
  xit { is_expected.to have_many :posts }
  xit { is_expected.to have_many :events }
end
