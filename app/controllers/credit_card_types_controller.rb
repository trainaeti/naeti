class CreditCardTypesController < ApplicationController
  # GET /credit_card_types
  # GET /credit_card_types.xml
  def index
    @credit_card_types = CreditCardType.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @credit_card_types }
    end
  end

  # GET /credit_card_types/1
  # GET /credit_card_types/1.xml
  def show
    @credit_card_type = CreditCardType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @credit_card_type }
    end
  end

  # GET /credit_card_types/new
  # GET /credit_card_types/new.xml
  def new
    @credit_card_type = CreditCardType.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @credit_card_type }
    end
  end

  # GET /credit_card_types/1/edit
  def edit
    @credit_card_type = CreditCardType.find(params[:id])
  end

  # POST /credit_card_types
  # POST /credit_card_types.xml
  def create
    @credit_card_type = CreditCardType.new(params[:credit_card_type])

    respond_to do |format|
      if @credit_card_type.save
        format.html { redirect_to(@credit_card_type, :notice => 'Credit card type was successfully created.') }
        format.xml  { render :xml => @credit_card_type, :status => :created, :location => @credit_card_type }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @credit_card_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /credit_card_types/1
  # PUT /credit_card_types/1.xml
  def update
    @credit_card_type = CreditCardType.find(params[:id])

    respond_to do |format|
      if @credit_card_type.update_attributes(params[:credit_card_type])
        format.html { redirect_to(@credit_card_type, :notice => 'Credit card type was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @credit_card_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /credit_card_types/1
  # DELETE /credit_card_types/1.xml
  def destroy
    @credit_card_type = CreditCardType.find(params[:id])
    @credit_card_type.destroy

    respond_to do |format|
      format.html { redirect_to(credit_card_types_url) }
      format.xml  { head :ok }
    end
  end
end
