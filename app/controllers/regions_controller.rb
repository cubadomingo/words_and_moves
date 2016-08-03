class RegionsController < ApplicationController

  def explore
    #currently have this so the navbar can work but the nav won't have a region name for the explore
    @regions = Region.all
  end

  def new
    @region = Region.new
  end

  def create
    @region = Region.new(region_params)
    if @region.save
      flash[:success] = "The new region was created!"
      redirect_to :back
    else
      flash[:danger] = "Fix the errors"
      redirect_to :back
    end
  end

  def feed
    @region = Region.friendly.find(params[:slug])
    @events = @region.events
    @posts = @region.posts
  end

  def event
    @region = Region.friendly.find(params[:slug])
    @event = @region.events.friendly.find(params[:slug2])
  end

  def post
    @region = Region.friendly.find(params[:slug])
    @post = @region.posts.friendly.find(params[:slug2])
  end

  private

  def region_params
    params.require(:region).permit(:name)
  end
end
