class SubscribersController < ApplicationController

  #creates a new subscriber, redirects to root_path and sends an email
  def create
    @subscriber = Subscriber.new(subscriber_params)
    if @subscriber.save
      flash[:success] = "Thanks for subcribing!"
      redirect_to root_path
      LiveUpdateMailer.subscribing(@subscriber).deliver
    elsif subscriber = Subscriber.find_by(subscriber_params); Subscriber.exists?(subscriber.id)
      flash[:danger] = "You are already subscribed!"
      redirect_to root_path
    else
      flash[:danger] = "Please enter a valid email address!"
      redirect_to root_path
    end

  end

  private
    #allowed params for creating subscriber
    def subscriber_params
      params.require(:subscriber).permit(:email)
    end
end

