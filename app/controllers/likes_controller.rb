class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  before_action :set_user

  #likes an item
  def like
    @item.like!(@user)
    redirect_back(fallback_location: root_path)
  end

  #unlikes an item
  def unlike
    @like = @item.likes.find_by(params[:id])
    @like.destroy!
    redirect_back(fallback_location: root_path)
  end

  private

  #sets current_user to instance variable
  def set_user
    @user = current_user
  end

  #sets item as either individual post or event
  def set_item
    if params[:item_class] == "Post"
      @item = Post.find(params[:item_id])
    else
      @item = Event.find(params[:item_id])
    end
  end
end
