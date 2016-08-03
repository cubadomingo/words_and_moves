require 'rails_helper'

RSpec.describe DislikesController, type: :controller do
  let(:user) { FactoryGirl.create :user }
  let(:event) { FactoryGirl.create :event }
  let(:post_item) { FactoryGirl.create :post }
  before { sign_in user }

  describe "create" do
    context "Event" do
      it "creates a new dislike" do
        count = event.dislikes.count
        post :create, params: { :item_id => event.id, :item_class => event.class.to_s }
        expect(event.dislikes.count).to be > count
      end
      context "when user has already liked event" do
        it "does not create a new dislike" do
          event.dislikes.create!(user_id: user.id)
          count = event.dislikes.count
          post :create, params: { :item_id => event.id, :item_class => event.class.to_s }
          expect(flash[:danger]).to eq("Sorry, you've already disliked this Event")
          expect(event.dislikes.count).to eq(count)
        end
      end
    end
    context "Post" do
      it "creates a new dislike" do
        count = post_item.dislikes.count
        post :create, params: { :item_id => post_item.id, :item_class => post_item.class.to_s }
        expect(post_item.dislikes.count).to be > count
      end
    end
  end
  describe "destroy" do
    it "decreases the likes count by 1" do
      dislike = event.dislikes.create!(user_id: user.id)
      count = event.dislikes.count
      delete :destroy, params: { id: dislike.id, :item_class => event.class.to_s }
      expect(event.dislikes.count).to be < count
    end
  end
end
