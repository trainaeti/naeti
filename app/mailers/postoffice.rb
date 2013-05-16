class Postoffice < ActionMailer::Base
  default :from => "trainaeti@aol.com"

  default :from => "NO-REPLY@naeti.com"  
  default :reply_to => "NO-REPLY@naeti.com"  
  
  #default :to => "support@dblsystems.com"
  default :to => "trainaeti@aol.com"
  
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.postoffice.contact.subject
  #
  def contact
    @greeting = "Hi"

    mail(:to => "trainaeti@aol.com")
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.postoffice.on_site_training.subject
  #
  def on_site_training(on_site_training)

    @on_site_training = on_site_training
    mail(:to => @on_site_training.email, :subject=>"On-Site Training Request")
  end
  
  def user_receipt_for_purchase(order, total)
    @order = order
    @total = total
        
    mail(:to => order.email, :subject => "[Naeti.com] Receipt for Class Registration")
  end

  def admin_receipt_for_purchase(order, total)
    @order = order
    @total = total
    mail(:reply_to=>order.email, :subject => "[Naeti.com] New Order From #{order.user.email}")
  end
  
  def registrant_receipt_for_purchase(item)
    @item = item        
    mail(:to => item.registrant.email, :subject => "[Naeti.com] Receipt for Class Registration")
  end
      
  def class_reminder(email, message)
    @message = message
    mail(:to => email,:subject => "[Naeti.com] Reminder For Your Upcoming Class")      
  end

  
end
