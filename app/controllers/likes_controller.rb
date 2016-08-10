class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: :create
  before_action :set_like, only: :destroy
  before_action :verify_non_repeat, only: :create


  def create
    if @item.likes.create!(user_id: current_user.id)
      flash[:success] = "Thank you for liking this #{@item.class}"
    else
      flash[:danger] = "Sorry, you've already liked this #{@item.class}"
    end
    redirect_back(fallback_location: root_path)
  end

  def destroy
    if @like.destroy
      flash[:warning] = "You have unliked this #{params[:item_class]}"
    else
      flash[:danger] = "Sorry, something went wrong"
    end
    redirect_back(fallback_location: root_path)
  end

  private

  def set_item
    if params[:item_class] == "Post"
      @item = Post.find(params[:item_id])
    else
      @item = Event.find(params[:item_id])
    end
  end

  def set_like
    @like = Like.find(params[:id])
  end

  def verify_non_repeat
    unless @item.likes.where(user: current_user).empty?
      flash[:danger] = "Sorry, you've already liked this #{@item.class}"
      redirect_back(fallback_location: feed_path)
    end
  end
end
