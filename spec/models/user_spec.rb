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
