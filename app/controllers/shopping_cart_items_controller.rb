class ShoppingCartItemsController < ApplicationController
#  before_filter :authenticate_admin
#  before_filter :authenticate

  
  # GET /shopping_cart_items
  # GET /shopping_cart_items.xml
  def index
    @shopping_cart_items = ShoppingCartItem.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @shopping_cart_items }
    end
  end

  # GET /shopping_cart_items/1
  # GET /shopping_cart_items/1.xml
  def show
  
    @shopping_cart_item = ShoppingCartItem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @shopping_cart_item }
    end
  end

  # GET /shopping_cart_items/new
  # GET /shopping_cart_items/new.xml
  def new
    @shopping_cart_item = ShoppingCartItem.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @shopping_cart_item }
    end
  end

  # GET /shopping_cart_items/1/edit
  def edit
    @shopping_cart_item = ShoppingCartItem.find(params[:id])
  end

  # POST /shopping_cart_items
  # POST /shopping_cart_items.xml
  def create
    @shopping_cart_item = ShoppingCartItem.new(params[:shopping_cart_item])

    respond_to do |format|
      if @shopping_cart_item.save
        format.html { redirect_to(@shopping_cart_item, :notice => 'Shopping cart item was successfully created.') }
        format.xml  { render :xml => @shopping_cart_item, :status => :created, :location => @shopping_cart_item }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @shopping_cart_item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /shopping_cart_items/1
  # PUT /shopping_cart_items/1.xml
  def update
    @shopping_cart_item = ShoppingCartItem.find(params[:id])

    respond_to do |format|
      if @shopping_cart_item.update_attributes(params[:shopping_cart_item])
        format.html { redirect_to(@shopping_cart_item, :notice => 'Shopping cart item was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @shopping_cart_item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /shopping_cart_items/1
  # DELETE /shopping_cart_items/1.xml
  def destroy
    retrieve_shopping_cart   
    @shopping_cart_item = ShoppingCartItem.where(:id=>params[:id]).where(:shopping_cart_id=>@shopping_cart.id).first()
    @shopping_cart_item.destroy
    retrieve_shopping_cart 
    
    respond_to do |format|
      format.html { redirect_to(new_order_path)} #redirect_to(shopping_cart_items_url) }
      format.xml  { head :ok }
      format.js {}
    end
  end
end
