class LiveUpdateMailer < ApplicationMailer
  #send the new subscriber a thank you email
  def subscribing(subscriber)
    @subscriber = subscriber
    mail(to: @subscriber.email, subject: "Thanks for your interest!")
  end
end
