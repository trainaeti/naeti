class ApplicationController < ActionController::Base
  #protect_from_forgery
  
  before_filter :set_page_title
  filter_parameter_logging :card_number, :card_verification
  
  def set_page_title
    @page_title = "NATIONAL ASBESTOS & ENVIRONMENTAL TRAINING INSTITUTE"
    if params[:controller] == "site" and params[:action] == "index"
      @home = true
    end
    
  end
  
  def authenticate_admin
    if current_user
      redirect_to new_order_path unless current_user.admin?
    else
      redirect_to new_user_session_path
    end
  end
    
  def authenticate_instructor
    if current_user
      redirect_to new_order_path unless current_user.instructor?
    else
      redirect_to new_user_session_path
    end
  end  
    
  def authenticate
    redirect_to new_user_session_path if current_user.blank?
  end  
    
  private

  # Overwriting the sign_out redirect path method
  def after_sign_in_path_for(resource_or_scope)
    new_order_path
  end

  def retrieve_shopping_cart
  
    if session[:shopping_cart_id]
       @shopping_cart ||= ShoppingCart.where(:id=>request.session[:shopping_cart_id]).where(:purchased_at=>nil).first()
       session[:shopping_cart_id] = nil if @shopping_cart.blank?
      #@shopping_cart = ShoppingCart.where(:id=>request.session[:shopping_cart_id]).where(:purchased_at=>nil).first
    end
    
    if session[:shopping_cart_id].nil?
      @shopping_cart = ShoppingCart.create!(:session_id=>request.session[:session_id])
      session[:shopping_cart_id] = @shopping_cart.id
      #@shopping_cart = ShoppingCart.create(:session_id=>request.session[:session_id])
      #session[:shopping_cart_id] = @shopping_cart.id    
    end
    
    @total = 0
    @shopping_cart.shopping_cart_items.each do |item|
    
      if item.course_date.class_size.present?
        if (item.course_date.class_size > 0)
          @total = @total + item.course.price
        end
      end
      #TODO - build in waiting list functions
      #@total = @total + item.course.price
    end
    @shopping_cart.total = @total
    @shopping_cart.save
  end

  def add_to_cart(course, course_date, registrant)
        
    #check for dupes in shopping cart
    #shopping_cart_item = ShoppingCartItem.where(:course_id=>course.id, :shopping_cart_id=>session[:shopping_cart_id]).first
    #if shopping_cart_item
    #  flash.now[:notice] = "You already have this course in your shopping cart."
    #  return false
    #else
      shopping_cart_item = ShoppingCartItem.create(:course_id=>course.id, :course_date_id=>course_date.id, :shopping_cart_id=>session[:shopping_cart_id], :registrant_id=>registrant.id)
      
      @shopping_cart.shopping_cart_items << shopping_cart_item
      return true
    #end
    
  end
  
    
end
