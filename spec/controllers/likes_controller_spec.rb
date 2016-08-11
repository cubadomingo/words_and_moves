require 'rails_helper'

RSpec.describe LikesController, type: :controller do
  let(:user) { FactoryGirl.create :user }
  let(:event) { FactoryGirl.create :event }
  let(:post_item) { FactoryGirl.create :post }
  before { sign_in user }

  describe "create" do
    context "Event" do
      it "creates a new likes" do
        count = event.likes.count
        post :like, params: { :item_id => event.id, :item_class => event.class.to_s }
        expect(event.likes.count).to be > count
      end
    end
    context "Post" do
      it "creates a new like" do
        count = post_item.likes.count
        post :like, params: { :item_id => post_item.id, :item_class => post_item.class.to_s }
        expect(post_item.likes.count).to be > count
      end
    end
  end
  describe "destroy" do
    it "decreases the likes count by 1" do
      like = event.likes.create!(user_id: user.id)
      count = event.likes.count
      delete :unlike, params: { item_id: event.id, :item_class => event.class.to_s }
      expect(event.likes.count).to be < count
    end
  end
end
