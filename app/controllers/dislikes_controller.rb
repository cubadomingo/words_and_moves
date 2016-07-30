class DislikesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item

  def create
    dislike = @item.dislikes.create!(user_id: current_user.id)
    flash[:success] = "You disliked that #{@item.class}"
    redirect_to :back
  end

  private

  def set_item
    if params[:item_class] == "Post"
      @item = Post.find(params[:item_id])
    else
      @item = Event.find(params[:item_id])
    end
  end
end
