class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_region
  before_action :set_city, only: [:create]

 #finds all events and subregions
 def show
    #finds the events through the slug using the friendly_id gem
    @event = @region.events.friendly.find(params[:slug])
  end

  #creates a new event
  def new
    @event = Event.new
  end

  #creates event succesfully and redirect to the region path or fails and redirects back to the new event view
  def create
    if @city.events.create!(event_params)
      flash[:success] = "Thank you for creating an Event"
      redirect_to region_path(@region)
    else
      flash[:danger] = "Sorry, something went wrong"
      redirect_back(fallback_location: new_region_event_path(@region))
    end
  end

  #finds the event to edit
  def edit
    @event = Event.friendly.find(params[:slug])
  end

  #edits event succesfully and redirects to region path or fails and redirects to edit event view
  def update
    @event = Event.friendly.find(params[:slug])
    if @event.update_attributes(post_params)
      flash[:success] = "Thank you for updating this event"
      redirect_to region_path(@region)
    else
      flash[:danger] = "Sorry, something went wrong"
      redirect_back(fallback_location: edit_region_event_path(@region))
    end
  end

  #destroys event succesfully and/or fails and redirects to the region path
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

  #sets the region to instance variable
  def set_region
    @region = Region.friendly.find(params[:region_slug])
  end

  #sets the city to instance variable
  def set_city
    @city = City.find(params[:event][:city_id])
  end

  #sets allowed params when creating a new event
  def event_params
    params.require(:event).permit(:title, :body, :venue, :date, :time, :city_id, :category_id).merge(user_id: current_user.id)
  end
end
