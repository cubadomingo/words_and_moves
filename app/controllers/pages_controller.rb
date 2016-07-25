class PagesController < ApplicationController

  def index
  	@user = current_user
  end

  def landing
    render :layout => false
  end
end
