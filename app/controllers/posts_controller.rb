class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_region

  def show
    @post = @region.posts.friendly.find(params[:slug])
  end

  def new
    @post = Post.new
  end

  def create
    if @region.posts.create!(post_params)
      flash[:success] = "Thank you for creating a post"
      redirect_to region_path(@region)
    else
      flash[:danger] = "Sorry, something went wrong"
      redirect_back(fallback_location: new_region_post_path(@region))
    end
  end

  def edit
    @post = Post.friendly.find(params[:slug])
  end

  def update
    @post = Post.friendly.find(params[:slug])
    if @post.update_attributes(post_params)
      flash[:success] = "Thank you for updating this post"
      redirect_to region_path(@region)
    else
      flash[:danger] = "Sorry, something went wrong"
      redirect_back(fallback_location: new_region_post_path(@region))
    end
  end

  def destroy
    @post = Post.friendly.find(params[:slug])
    if @post.destroy
      flash[:warning] = "You have successfully deleted a Post"
    else
      flash[:danger] = "Sorry, something went wrong"
    end
    redirect_back(fallback_location: region_path)
  end

  private

  def set_region
    @region = Region.friendly.find(params[:region_slug])
  end

  def post_params
    params.require(:post).permit(:title, :body, :category_id)
  end
end
