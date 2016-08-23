class DislikesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user
  before_action :set_item

  #dislikes an item
  def dislike
    @item.dislike!(@user)
    redirect_back(fallback_location: root_path)
  end

  #undislikes an item
  def undislike
    @dislike = @item.dislikes.find_by(params[:id])
    @dislike.destroy!
    redirect_back(fallback_location: root_path)
  end

  private

  #sets the current user to an user instance variable
  def set_user
    @user = current_user
  end

  #sets wether an item is a post or an event
  def set_item
    if params[:item_class] == "Post"
      @item = Post.find(params[:item_id])
    else
      @item = Event.find(params[:item_id])
    end
  end
end
