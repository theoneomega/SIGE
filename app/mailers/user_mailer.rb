class UserMailer < ActionMailer::Base
  default :from =>"pruebas_dieid@gmail.com"
  def registration_confirmation(event)
    mail(:to=>"theoneomega@gmail.com", :subject=> "Nuevo Evento")
    
  end
  
  def event_registration(event)
    @event=event
    mail(:to => "theoneomega@gmail.com, luism.x89@gmail.com", :subject => "Nuevo evento registrado", :from => "pruebas_dieid@gmail.com")
  end
end
