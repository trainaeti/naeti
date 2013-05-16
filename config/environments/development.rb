Naeti::Application.configure do
  # Settings specified here will take precedence over those in config/environment.rb

  # In the development environment your application's code is reloaded on
  # every request.  This slows down response time but is perfect for development
  # since you don't have to restart the webserver when you make code changes.
  config.cache_classes = false

  # Log error messages when you accidentally call methods on nil.
  config.whiny_nils = true

  # Show full error reports and disable caching
  config.consider_all_requests_local       = true
  config.action_view.debug_rjs             = true
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send

  # Print deprecation notices to the Rails logger
  config.active_support.deprecation = :log
  
  #config.action_mailer.default_url_options = { :host => 'localhost:3000' }
  # A dummy setup for development - no deliveries, but logged
  require 'tlsmail' 
  Net::SMTP.enable_tls(OpenSSL::SSL::VERIFY_NONE)
  
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.perform_deliveries = true
  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.default :charset => "utf-8"
  
  config.action_mailer.default_url_options = { :host => 'http://naeti.com' }
  
  # config/environment/production.rb
  config.after_initialize do 
    ActiveMerchant::Billing::LinkpointGateway.pem_file = File.read(File.dirname(__FILE__) + '/../1001243637.pem') 
    ActiveMerchant::Billing::Base.mode = :production
    GATEWAY = ActiveMerchant::Billing::LinkpointGateway.new( 
          :login =>"1001243637"
        )
  end
    
end
