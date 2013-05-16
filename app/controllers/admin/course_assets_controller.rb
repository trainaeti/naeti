class Admin::CourseAssetsController < ApplicationController
  before_filter :authenticate_admin

  # GET /course_assets
  # GET /course_assets.xml
  def index
    @course_assets = CourseAsset.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @course_assets }
    end
  end

  # GET /course_assets/1
  # GET /course_assets/1.xml
  def show
    @course_asset = CourseAsset.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @course_asset }
    end
  end

  # GET /course_assets/new
  # GET /course_assets/new.xml
  def new
    @course_asset = CourseAsset.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @course_asset }
    end
  end

  # GET /course_assets/1/edit
  def edit
    @course_asset = CourseAsset.find(params[:id])
  end

  # POST /course_assets
  # POST /course_assets.xml
  def create
    @admin_section = true

    @course_asset = CourseAsset.new(params[:course_asset])

    respond_to do |format|
      if @course_asset.save
        format.html { redirect_to(@course_asset, :notice => 'File(s) were successfully uploaded.') }
        format.xml  { render :xml => @course_asset, :status => :created, :location => @course_asset }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @course_asset.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /course_assets/1
  # PUT /course_assets/1.xml
  def update
    @course_asset = CourseAsset.find(params[:id])

    respond_to do |format|
      if @course_asset.update_attributes(params[:course_asset])
        format.html { redirect_to(@course_asset, :notice => 'Course asset was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @course_asset.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /course_assets/1
  # DELETE /course_assets/1.xml
  def destroy

    @course = CourseAsset.where(:id=>params[:id]).first.course_id
    @course_asset = CourseAsset.where(:id=>params[:id]).first
    @course_asset.destroy

    respond_to do |format|
      format.html { redirect_to(admin_course_url(@course.to_param)<<"#tabs-4") }
      format.js {}
      format.xml  { head :ok }
    end
  end

end
