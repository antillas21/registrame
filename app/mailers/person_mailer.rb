class PersonMailer < ActionMailer::Base
  default :from => "#{APP_CONFIG['mail_sender_name']} <#{APP_CONFIG['mail_sender_email']}>"

  def registration_confirmation(person)
    @person = person
    @event = Event.first
    attachments.inline['registrame-logo.png'] = File.read("#{Rails.root.to_s}/public/images/registrame-logo.png")
    mail(:to => person.email, :subject => "Thanks for registering in #{@event.name}",
    :from => "#{@event.name} <#{APP_CONFIG['mail_sender_email']}>")
  end
end
