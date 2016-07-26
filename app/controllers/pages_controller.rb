class PagesController < ApplicationController
  def landing
    @subscriber = Subscriber.new
    render :layout => false
  end
end
