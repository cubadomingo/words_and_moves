# Preview all emails at http://localhost:3000/rails/mailers/live_update
class LiveUpdatePreview < ActionMailer::Preview
  def subscribing_mail_preview
    LiveUpdateMailer.subscribing(Subscriber.first)
  end
end
