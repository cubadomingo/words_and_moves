require 'rails_helper'

RSpec.describe LikesController, type: :controller do
  let(:user) { FactoryGirl.create :user }
  let(:event) { FactoryGirl.create :event }
  let(:post_item) { FactoryGirl.create :post }
  describe "create" do
    before { sign_in user }
    context "Event" do
      it "creates a new likes" do
        count = event.likes.count
        post :create, { :item_id => event.id, :item_class => event.class.to_s }
        expect(event.likes.count).to be > count
      end
      context "when user has already liked event" do
        it "does not create a new like" do
          event.likes.create!(user_id: user.id)
          count = event.likes.count
          post :create, { :item_id => event.id, :item_class => event.class.to_s }
          expect(flash[:danger]).to eq("Sorry, you've already liked this Event")
          expect(event.likes.count).to eq(count)
        end
      end
    end
    context "Post" do
      it "creates a new like" do
        count = post_item.likes.count
        post :create, { :item_id => post_item.id, :item_class => post_item.class.to_s }
        expect(post_item.likes.count).to be > count
      end
    end
  end
end
