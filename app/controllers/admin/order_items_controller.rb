class Admin::OrderItemsController < ApplicationController
  before_filter :authenticate_admin
    
  # GET /order_items
  # GET /order_items.xml
  def index
    @page_title = "Transactions"
    @admin_section = true

    @order_items = OrderItem.page(params[:page]).per(10) 

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @order_items }
    end
  end

  # GET /order_items/1
  # GET /order_items/1.xml
  def show
    @order_item = OrderItem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @order_item }
    end
  end

  # GET /order_items/new
  # GET /order_items/new.xml
  def new
    @order_item = OrderItem.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @order_item }
    end
  end

  # GET /order_items/1/edit
  def edit
    @order_item = OrderItem.find(params[:id])
  end

  # POST /order_items
  # POST /order_items.xml
  def create
    @order_item = OrderItem.new(params[:order_item])

    respond_to do |format|
      if @order_item.save
        format.html { redirect_to(@order_item, :notice => 'Order item was successfully created.') }
        format.xml  { render :xml => @order_item, :status => :created, :location => @order_item }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @order_item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /order_items/1
  # PUT /order_items/1.xml
  def update
    @order_item = OrderItem.find(params[:id])

    respond_to do |format|
      if @order_item.update_attributes(params[:order_item])
        format.html { redirect_to(@order_item, :notice => 'Order item was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @order_item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /order_items/1
  # DELETE /order_items/1.xml
  def destroy
    @order_item = OrderItem.find(params[:id])
    @order_item.destroy

    respond_to do |format|
      format.html { redirect_to(order_items_url) }
      format.xml  { head :ok }
    end
  end

  def search
    @page_title = "Transactions"
    @admin_section = true

    @order_items=OrderItem.joins(:registrant).select("distinct order_items.*").where('registrants.email LIKE ? OR registrants.first_name LIKE ? OR registrants.last_name LIKE ? OR order_items.po_number LIKE ?', "%#{[params[:search_term]]}%", "%#{[params[:search_term]]}%", "%#{params[:search_term]}%", "%#{[params[:search_term]]}%")
    
    @order_items = @order_items.where('order_items.created_at >= ? AND order_items.created_at <= ?', "#{params[:from]} 00:00:00", "#{params[:to]} 23:59:59") if (params[:to].present? && params[:from].present?)
   
    #@order_items = @order_items.page(params[:page]).per(10)
    render :action=>"index"  
    
  end

  def confirm
    @order_item = OrderItem.find(params[:id])
    @order_item.is_confirmed=true

    respond_to do |format|
      if @order_item.save
        format.js {}
      end
    end
        
  end
    
end
