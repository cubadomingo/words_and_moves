class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:feed]

  def feed
    @item_list = City.first.events + Region.first.posts
  end

  private

  def set_user
    @user = current_user
  end

end
