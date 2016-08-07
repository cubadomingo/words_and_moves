class RegionsController < ApplicationController

  def index
    @regions = Region.all
  end

  def show
    @region = Region.find(1)
    @subregions =  @region.subregions
    @categories = Category.all
    @events = @region.events
    @posts = @region.posts
  end

  def edit
    @region = Region.friendly.find(params[:slug])
    @categories = Category.all

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

  def update
  end

  private

  def region_params
    params.require(:region).permit(:name)
  end
end
