class SubscribersController < ApplicationController

  def create
    @subscriber = Subscriber.new(subscriber_params)
    if @subscriber.save
      flash[:success] = "Thanks for subcribing!"
      redirect_to root_path
    else
      flash[:danger] = "Please enter a valid email address!"
      redirect_to root_path
    end
  end

  private
    def subscriber_params
      params.require(:subscriber).permit(:email)
    end
end
