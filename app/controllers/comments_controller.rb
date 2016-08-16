class CommentsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_item

  def index
    @comments = @item.comments.order(created_at: :asc)
    respond_to do |format|
      format.html # default html response
      format.json { render json: @comments }
    end
  end

  def create
    @comment = @item.comments.create!(user_id: current_user.id, body: params[:text])
    respond_to do |format|
      format.html # default html response
      format.json { render json: @comment }
    end
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
