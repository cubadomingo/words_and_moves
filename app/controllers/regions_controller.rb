class RegionsController < ApplicationController

  #Gets all regions
  def index
    @regions = Region.all
  end

  #finds individual region through slug(friendly_id) and creates an item list of both posts and events
  def show
    @region = Region.friendly.find(params[:slug])
    @item_list = @region.posts + @region.events
  end

  #finds individual region through slug(friendly_id)
  def edit
    @region = Region.friendly.find(params[:slug])
  end

  #makes a new region
  def new
    @region = Region.new
  end

  #succesfully creates a region or fails. Both redirect back
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

  private

  #sets regions params that are allowed
  def region_params
    params.require(:region).permit(:name)
  end
end
