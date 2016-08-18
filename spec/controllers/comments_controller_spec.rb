require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  let(:user) { FactoryGirl.create :user }
  let(:post_item) { FactoryGirl.create :post }
  let(:event) { FactoryGirl.create :event }
  describe "Create comment" do
    it "increases comment count" do
      sign_in user
      count = Comment.count
      post :create, params: { text: "This is a test comment", post_id: post_item.id, item_type: post_item.class.to_s }
      expect(Comment.count).to be > count
    end
    it "creates a new comment" do
      sign_in user
      post :create, params: { text: "This is a test comment", post_id: post_item.id, item_type: post_item.class }
      expect(post_item.comments.last.body).to eq("This is a test comment")
      expect(post_item.comments.last.user).to eq(user)
    end
  end
end