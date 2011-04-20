class PersonMailer < ActionMailer::Base
  default :from => "#{APP_CONFIG['mail_sender_name']} <#{APP_CONFIG['mail_sender_email']}>"
  
  def registration_confirmation(person)
    @person = person
    mail(:to => person.email, :subject => "Thanks for registering in #{APP_CONFIG['event_name']}")
  end
end
