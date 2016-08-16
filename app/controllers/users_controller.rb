class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:info]
  before_action :set_user, only: [:show, :info]

  def show
    @item_list = @user.preferred_regions.map { |x| x.posts.each {|y| y} }.flatten
    @region_list = @user.preferred_regions
    @categories = Category.all
  end

  def info
    @user = User.find(params[:id])
    respond_to do |format|
      format.html # default html response
      format.json { render json: @user }
    end
  end

  private

  def set_user
    @user = current_user
  end

end
