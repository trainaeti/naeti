class CheckoutController < ApplicationController
   
   #before_filter :authenticate
   def index 
   
     @page_title = "Register for NAETI Courses"
     @padding = true
     retrieve_shopping_cart
     
      if current_user
         @user = current_user
      else
         @user = User.new
      end
      
     #update cart for removals
     if params[:remove]
       for id in params[:shopping_cart_item][:ids]
         @shopping_cart_item = ShoppingCartItem.where(:id=>id).first
         @shopping_cart_item.destroy
       end
     end
     
     retrieve_shopping_cart

     if params[:user]
       
       if current_user
         @user.update_attributes(params[:user])
         @user = set_credit_card_info(@user)
          
         if @user.valid?
           process_checkout
         else
           flash.now[:notice] = "Please correct the indicated fields."
         end
       else
         
         #login
         #if params[:email] != '' and params[:password] != ''
           
         #  login_user = User.where(:email=>params[:email]).first
           
           #login successful
           #NEED TO LOGIN WITH DEVISE
           
           
         #  unless login_user.blank?
         #    if login_user.valid_password? params[:password]
         #      login_user.update_attributes(params[:user])
             
         #      login_user = set_credit_card_info(login_user)
             
         #      #credit card info included
         #      if login_user.valid?
         #        current_user = login_user
         #        process_checkout
         #      #credit card info missing
         #      else
         #        @user = login_user
         #        flash.now[:notice] = "Please correct the indicated fields."
         #      end
         #    
         #      @user = login_user
         #   
         #    #login unsuccessful 
         #    else
         #      flash.now[:notice] = "Your login is incorrect"
         #    end
         #   end
         # else  
           #register
           
           @user = User.new(params[:user])
           @user = set_credit_card_info(@user)
           
           if @user.valid?
             @user.save
             process_checkout
           else
             flash.now[:notice] = "Please correct the indicated fields."
           end
        # end
       end

     end
   
 end
 
  def confirmed
    @page_title = "Register for NAETI Courses - Confirmed"
    @order = Order.where(:transaction_id=>params[:transaction_id]).first
  end
   
 private 
 
   def process_checkout
     
     #@total is calculated in application controller
     @amount = ((@total).to_f * 100).to_i

     credit_card = ActiveMerchant::Billing::CreditCard.new(
                  :first_name         => @user.first_name,
                  :last_name          => @user.first_name,
                  :number             => @user.credit_card_number,
                  :month              => @user.expiration_month,
                  :year               => @user.expiration_year,
                  :verification_value => @user.security_code
                )

     if credit_card.valid?

      #gateway = ActiveMerchant::Billing::LinkpointGateway.new(:login=>"243637", :password=>"password", :test=>true)

       billing_address = { :name => @user.name, :address1 => @user.address,
      :city => @user.city, :state => @user.state,
      :country => 'US', :zip => @user.zip}

      options = {:ip=>request.remote_ip, :order_id=>@shopping_cart.id}

      response = GATEWAY.authorize(@amount, credit_card, options)

      #remove this when we have real Authorize.net login, couldn't get it to work in test mode
      @local_request = true

      if response.success? or @local_request
        
          unless @local_request
            GATEWAY.capture(@amount.to_i, response.authorization, options)
            transaction_id = response.authorization
          else
            transaction_id = "localtest123"
          end
                  Order.transaction do

#this needs some work. 

#STEPS

#1 - If transaction  is successfull then save (bounce to model)
#2 - If tx succ then update registrant model flags
#3 - If tx succ then send emails
#4 - Before tx succ check class size - put as a filter for save/update - maybe on prev - before user can checkout
#5 - Need to account for 
                    @order = Order.create(:transaction_id=>transaction_id, :user_id=>@user.id, :total=>@shopping_cart.total)

                    for item in @shopping_cart.shopping_cart_items
                      
                      @order_item = OrderItem.create(:course_id=>item.course_id, :course_date_id=>item.course_date_id, :price=>item.course.price, :registrant_id=>item.registrant_id)
                      @order.order_items << @order_item
                      
                      if @order_item.course_date.class_size == 0
                        status = "Waiting List"
                        @order_item.price = 0
                        @order_item.save
                      else
                        status = "Paid"
                      end
                      
                      #@course_registrant = CourseRegistrant.create(:status=>status, :course_id=>item.course_id, :course_date_id=>item.course_date_id, :registration_date=>Time.now().to_date, :user_id=>@user.id, :registrant_id=>item.registrant_id)
                      
                      @order_item.course_date.class_size = @order_item.course_date.class_size - 1
                      @order_item.course_date.save
                    end

                    ShoppingCartItem.delete_all(:shopping_cart_id=>@shopping_cart.id)
                    @shopping_cart.delete
                    session[:shopping_cart_id] = nil
                    
                    Postoffice.admin_receipt_for_purchase(@order, @shopping_cart.total).deliver
                    Postoffice.user_receipt_for_purchase(@order, @shopping_cart.total).deliver
            
                   # Postoffice.admin_receipt_for_purchase(@order).deliver
                   # Postoffice.user_receipt_for_purchase(@order).deliver
                   # Postoffice.registrant_receipt_for_purchase(@order).deliver
                    
                    redirect_to "/checkout/confirmed/" + transaction_id.to_s
                  end
       else
        #@customer.delete
        #puts "Fail: " + response.message.to_s
        #render :text=>response.message
        #redirect_to "/order_review?error=true"
        @cc_error = response.message

      end

     else
      #@customer.delete

      #puts "Fail: " + response.message.to_s
      #render :text=>response.message
      #redirect_to "/order_review?error=true"
      @cc_error = "Credit card is not valid."


     end

 
   end   

   def set_credit_card_info(user)
      user.state_id = params[:user][:state_id].to_i
      user.credit_card_type_id = params[:user][:credit_card_type_id]
      user.credit_card_number = params[:user][:credit_card_number]
      user.security_code = params[:user][:security_code]
      user.expiration_month = params[:user][:expiration_month].to_i
      user.expiration_year = params[:user][:expiration_year].to_i
      return user
   end
  
end
