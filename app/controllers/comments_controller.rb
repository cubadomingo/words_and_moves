class CommentsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_item

  #Shows order of the comments in ascending order from the time it was created; responds in regular html or json(for react).
  def index
    @comments = @item.comments.order(created_at: :asc)
    respond_to do |format|
      format.html # default html response
      format.json { render json: @comments }
    end
  end

  #Creates a new comments with the user_id and the text passed through params; responds in html or json(for react).
  def create
    @comment = @item.comments.create!(user_id: current_user.id, body: params[:text])
    respond_to do |format|
      format.html # default html response
      format.json { render json: @comment }
    end
  end

  private

  #Sets wether the item is an Event or a Post
  def set_item
    if params[:post_id].blank?
      @item = Event.find(params[:event_id])
    else
      @item = Post.find(params[:post_id])
    end
  end
end
