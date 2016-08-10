class DislikesController < ApplicationController
  before_action :set_item, only: :create
  before_action :set_dislike, only: :destroy
  before_action :verify_non_repeat, only: :create

  def create
    if signed_in?
      if @item.dislikes.create!(user_id: current_user.id)
        flash[:success] = "You have disliked this #{@item.class}"
      else
        flash[:danger] = "Sorry, you've already disliked this #{@item.class}"
      end
      redirect_back(fallback_location: root_path)
    else
      flash[:danger] = "Please Sign in or Sign up to like or dislike!"
      redirect_to(new_user_session_path)
    end
  end

  def destroy
    if @dislike.destroy
      flash[:warning] = "You have un-disliked this #{params[:item_class]}"
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

  def set_dislike
    @dislike = Dislike.find(params[:id])
  end

  def verify_non_repeat
    unless @item.dislikes.where(user: current_user).empty?
      flash[:danger] = "Sorry, you've already disliked this #{@item.class}"
      redirect_back(fallback_location: feed_path)
    end
  end
end
