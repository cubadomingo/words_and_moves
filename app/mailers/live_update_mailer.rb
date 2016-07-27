class LiveUpdateMailer < ApplicationMailer

  def subscribing(subscriber)
    @subscriber = subscriber
    mail(to: @subscriber.email, subject: "Thanks for Subscribing!")
  end
end
