class ApplicationMailer < ActionMailer::Base
  #sets who the email is from
  default from: "Words & Moves <postmaster@wordsandmoves.com>"
  #renders the mailer layout
  layout 'mailer'
end
