ActionMailer::Base.smtp_settings = {  
  :address              => "smtp.gmail.com",  
  :port                 => 587,  
  :domain               => "gmail.com",
  :user_name            => "desarrollo.dieid@gmail.com",
  :password             => "DIEID.2014",
  :authentication       => "plain",  
  :enable_starttls_auto => true  
}  