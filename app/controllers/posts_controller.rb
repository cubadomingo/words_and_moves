class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_region, except: [:show]

  def index
    @posts = @region.posts
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    if @region.posts.create!(post_params)
      flash[:success] = "Thank you for creating a post" 
      redirect_to region_feed_path(@region)
    else
      flash[:danger] = "Sorry, something went wrong"
      redirect_back(fallback_location: new_region_post_path(@region))
    end
  end

  def edit

  end

  def destroy

  end

  private

  def set_region
    @region = Region.friendly.find(params[:region_slug])
  end

  def post_params
    params.require(:post).permit(:title, :body, :category_id)
  end

end
