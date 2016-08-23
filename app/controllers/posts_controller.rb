class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_region, except: [:index]

  #finds post through slug with friendly_id gem
  def show
    @post = @region.posts.friendly.find(params[:slug])
  end

  #makes a new post with null attributes
  def new
    @post = Post.new
  end

  #creates a new post and redirects to region path or fails and redirects to new post view
  def create
    if @region.posts.create!(post_params)
      flash[:success] = "Thank you for creating a post"
      redirect_to region_path(@region)
    else
      flash[:danger] = "Sorry, something went wrong"
      redirect_back(fallback_location: new_region_post_path(@region))
    end
  end

  #finds post through slug to edit
  def edit
    @post = Post.friendly.find(params[:slug])
  end

  #succesfully updates the post and redirects to region path or redirects to edit post view
  def update
    @post = Post.friendly.find(params[:slug])
    if @post.update_attributes(post_params)
      flash[:success] = "Thank you for updating this post"
      redirect_to region_path(@region)
    else
      flash[:danger] = "Sorry, something went wrong"
      redirect_back(fallback_location: edit_region_post_path(@region))
    end
  end

  #destroys post succesfully or fails and redirects back
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

  #sets region to instance variable
  def set_region
    @region = Region.friendly.find(params[:region_slug])
  end

  #sets params allowed to create a post
  def post_params
    params.require(:post).permit(:title, :body, :category_id).merge(user_id: current_user.id)
  end
end
