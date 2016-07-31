require 'rails_helper'

RSpec.describe Event, type: :model do
  let(:event) { FactoryGirl.create :event }
  let(:user) { FactoryGirl.create :user }
  describe "Methods" do
    describe ".net_likes" do
      it "returns 1" do
        event.likes.create!(user_id: user.id)
        expect(event.net_likes).to eq(1)
      end
      context "when there is 1 like and 1 dislike" do
        it "returns 0" do
          event.likes.create!(user_id: user.id)
          event.dislikes.create!(user_id: user.id)
          expect(event.net_likes).to eq(0)
        end
      end
    end
  end
end
