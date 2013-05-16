#ActionMailer::Base.smtp_settings = {  
#  :address              => "smtp.gmail.com",  
#  :port                 => "587",  
#  :domain               => "naeti.com",  
#  :user_name            => "trainnaeti",  
#  :password             => "64ded5dee08487dabd1116cc3e916be4",  
#  :authentication       => "plain",  
#  :enable_starttls_auto => true  
#}  

#ActionMailer::Base.smtp_settings = {  
#  :address              => "smtp.gmail.com",  
#  :port                 => 587,  
#  :domain               => "bandsonabudget.com",  
#  :user_name            => "trainnaeti",  
#  :password             => "64ded5dee08487dabd1116cc3e916be4",  
#  :authentication       => "plain",  
#  :enable_starttls_auto => true  
#}  

ActionMailer::Base.smtp_settings = {
  :address        => 'smtp.sendgrid.net',
  :port           => '587',
  :authentication => :plain,
  :user_name      => 'trainaeti',
  :password       => 'team3321',
  :domain         => 'naeti.com'
}
ActionMailer::Base.delivery_method = :smtp

#ActionMailer::Base.default_url_options[:host] = "naeti.com"
#Mail.register_interceptor(DevelopmentMailInterceptor) if Rails.env.development?
