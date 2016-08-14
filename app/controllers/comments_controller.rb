class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item

  def create
    @item.comments.create!(user_id: current_user.id, body: params[:text])
  end

  private

  def set_item
    if params[:item_class] == "Event"
      @item = Event.find(params[:item_id])
    else
      @item = Post.find(params[:item_id])
    end
  end
end
