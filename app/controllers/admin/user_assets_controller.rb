class Admin::UserAssetsController < ApplicationController
  before_filter :authenticate_admin

  # GET /user_assets
  # GET /user_assets.xml
  def index
    @user_assets = UserAsset.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @user_assets }
    end
  end

  # GET /user_assets/1
  # GET /user_assets/1.xml
  def show
    @user_asset = UserAsset.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user_asset }
    end
  end

  # GET /user_assets/new
  # GET /user_assets/new.xml
  def new

    @user_asset = UserAsset.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user_asset }
    end
  end

  # GET /user_assets/1/edit
  def edit
    @user_asset = UserAsset.find(params[:id])
  end


  # POST /admin/user_assets
  # POST /admin/user_assets.xml
  def create
  
    @admin_section = true
    @user_asset = UserAsset.new(params[:user_asset])

    respond_to do |format|
      if @user_asset.save
        format.html { redirect_to(@user_asset, :notice => 'File(s) were successfully uploaded.') }
        format.xml  { render :xml => @user_asset, :status => :created, :location => @user_asset }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @user_asset.errors, :status => :unprocessable_entity }
      end
    end
  end


  # PUT /user_assets/1
  # PUT /user_assets/1.xml
  def update
    @user_asset = UserAsset.find(params[:id])

    respond_to do |format|
      if @user_asset.update_attributes(params[:user_asset])
        format.html { redirect_to(@user_asset, :notice => 'User asset was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user_asset.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /user_assets/1
  # DELETE /user_assets/1.xml
  def destroy
    @user = UserAsset.where(:id=>params[:id]).first.user_id
    @user_asset = UserAsset.where(:id=>params[:id]).first
    @user_asset.destroy

    respond_to do |format|
      format.html { redirect_to(user_path(@user.to_param)<<"#tabs-4") }
      format.js { }
      format.xml  { head :ok }
    end
  end
end
