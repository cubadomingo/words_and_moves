class DislikesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user
  before_action :set_item

  def dislike
    @item.dislike!(@user)
    redirect_to :back
  end

  def undislike
    @dislike = @item.dislikes.find_by(params[:id])
    @dislike.destroy!
    redirect_to :back
  end

  private

  def set_user
    @user = current_user
  end

  def set_item
    if params[:item_class] == "Post"
      @item = Post.find(params[:item_id])
    else
      @item = Event.find(params[:item_id])
    end
  end
end
