class PagesController < ApplicationController
  #creates a new subscriber for emailing update
  def landing
    @subscriber = Subscriber.new
    # does not render application layout
    render :layout => false
  end
end
