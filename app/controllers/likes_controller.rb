class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  before_action :set_user

  def like
    @item.like!(@user)
    redirect_back(fallback_location: root_path)
  end

  def unlike
    @like = @item.likes.find_by(params[:id])
    @like.destroy!
    redirect_back(fallback_location: root_path)
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
