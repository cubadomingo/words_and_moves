class EventsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_region

 def show
    @event = @region.events.friendly.find(params[:slug])
  end

  def new
    @event = Event.new
  end

  def create
    if @region.events.create!(event_params)
      flash[:success] = "Thank you for creating a post"
      redirect_to region_path(@region)
    else
      flash[:danger] = "Sorry, something went wrong"
      redirect_back(fallback_location: new_region_event_path(@region))
    end
  end

  def edit
    @event = Event.friendly.find(params[:slug])
  end

  def update
    @event = Event.friendly.find(params[:slug])
    if @event.update_attributes(post_params)
      flash[:success] = "Thank you for updating this event"
      redirect_to region_path(@region)
    else
      flash[:danger] = "Sorry, something went wrong"
      redirect_back(fallback_location: new_region_event_path(@region))
    end
  end

  def destroy
    @event = Event.friendly.find(params[:slug])
    if @event.destroy
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

  def event_params
    params.require(:event).permit(:title, :body, :location, :event_date, :city_id, :category_id)
  end
end
