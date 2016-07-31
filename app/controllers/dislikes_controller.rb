class DislikesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  before_action :verify_non_repeat

  def create
    if @item.dislikes.create!(user_id: current_user.id)
      flash[:success] = "You have disliked this #{@item.class}"
    else
      flash[:danger] = "Sorry, you've already disliked this #{@item.class}"
    end
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

  def verify_non_repeat
    unless @item.dislikes.where(user: current_user).empty?
      flash[:danger] = "Sorry, you've already disliked this #{@item.class}"
      redirect_to :back
    end
  end
end
