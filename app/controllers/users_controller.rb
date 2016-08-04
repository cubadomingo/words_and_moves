class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show]

  def show
    @item_list = @user.preferred_regions.map { |x| x.posts.each {|y| y} }.flatten
  end

  private

  def set_user
    @user = current_user
  end

end
