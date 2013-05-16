class CourseRegistrantsController < ApplicationController
  before_filter :authenticate_admin
  
  # GET /course_registrants
  # GET /course_registrants.xml
  def index
    @course_registrants = CourseRegistrant.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @course_registrants }
    end
  end

  # GET /course_registrants/1
  # GET /course_registrants/1.xml
  def show
    @course_registrant = CourseRegistrant.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @course_registrant }
    end
  end

  # GET /course_registrants/new
  # GET /course_registrants/new.xml
  def new
    @course_registrant = CourseRegistrant.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @course_registrant }
    end
  end

  # GET /course_registrants/1/edit
  def edit
    @course_registrant = CourseRegistrant.find(params[:id])
  end

  # POST /course_registrants
  # POST /course_registrants.xml
  def create
    @course_registrant = CourseRegistrant.new(params[:course_registrant])

    respond_to do |format|
      if @course_registrant.save
        format.html { redirect_to(@course_registrant, :notice => 'Course registrant was successfully created.') }
        format.xml  { render :xml => @course_registrant, :status => :created, :location => @course_registrant }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @course_registrant.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /course_registrants/1
  # PUT /course_registrants/1.xml
  def update
    @course_registrant = CourseRegistrant.find(params[:id])

    respond_to do |format|
      if @course_registrant.update_attributes(params[:course_registrant])
        format.html { redirect_to(@course_registrant, :notice => 'Course registrant was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @course_registrant.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /course_registrants/1
  # DELETE /course_registrants/1.xml
  def destroy
    @course_registrant = CourseRegistrant.find(params[:id])
    @course_registrant.destroy

    respond_to do |format|
      format.html { redirect_to(request.referer) }
      format.xml  { head :ok }
    end
  end
end
