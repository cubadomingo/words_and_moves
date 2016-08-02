class LiveUpdateMailer < ApplicationMailer

  def subscribing(subscriber)
    @subscriber = Subscriber.first
    mail(to: @subscriber.email, subject: "Thanks for Subscribing!")
  end
end
