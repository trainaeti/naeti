class OrdersController < ApplicationController

  #before_filter :authenticate
  
  def new
  
    @page_title = "Register for NAETI Courses"
    @padding = true
    retrieve_shopping_cart
     
    @order = Order.new
     
    current_user.present? ? @user = current_user : @user = User.new

    respond_to do |format|
      format.html {}
      format.xml  {}
      format.js {}    
    end
    
  end
  

  def create
    retrieve_shopping_cart
    @order = @shopping_cart.build_order(params[:order])
    @order.ip_address = request.remote_ip
    @order.user_id = current_user.id 
    
    respond_to do |format|
      if @order.save
        if @order.is_purchase_order.present?
          @order.purchase_order
          
          Postoffice.admin_receipt_for_purchase(@order, @total).deliver
          Postoffice.user_receipt_for_purchase(@order, @total).deliver

          @order.order_items.each do |item| 
            Postoffice.registrant_receipt_for_purchase(item).deliver
          end
            
          format.js {}
        else
          if @order.purchase
            Postoffice.admin_receipt_for_purchase(@order, @total).deliver
            Postoffice.user_receipt_for_purchase(@order, @total).deliver
            
            @order.order_items.each do |item| 
              Postoffice.registrant_receipt_for_purchase(item).deliver
            end
            
            format.js {}
            #render :action => "success"
          else
            @order.errors.add :base, "Invalid credit card"
            format.js {}
            #render :action => "failure"
          end
        end
      else
        format.js {}
      end
    end
    
  end
    
end
