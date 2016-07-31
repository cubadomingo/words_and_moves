require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:post) { FactoryGirl.create :post }
  let(:user) { FactoryGirl.create :user }
  describe "Methods" do
    describe ".net_likes" do
      it "returns 1" do
        post.likes.create!(user_id: user.id)
        expect(post.net_likes).to eq(1)
      end
      context "when there is 1 like and 1 dislike" do
        it "returns 0" do
          post.likes.create!(user_id: user.id)
          post.dislikes.create!(user_id: user.id)
          expect(post.net_likes).to eq(0)
        end
      end
    end
  end
end
