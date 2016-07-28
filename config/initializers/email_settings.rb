# config/initializers/email_settings.rb

ActionMailer::Base.smtp_settings = {
  user_name: 'SMTP_Injection',
  password: "super_secret_key",
  address: 'smtp.sparkpostmail.com',
  port: 587,
  enable_starttls_auto: true,
  format: :html,
}
