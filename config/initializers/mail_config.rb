ActionMailer::Base.smtp_settings = {
  :address => APP_CONFIG['mail_server'],
  :port => APP_CONFIG['mail_port'],
  :domain => APP_CONFIG['host'],
  :user_name => APP_CONFIG['mail_username'],
  :password => APP_CONFIG['mail_password'],
  :authentication => APP_CONFIG['mail_auth'],
  :enable_starttls_auto => APP_CONFIG['mail_starttls']
}