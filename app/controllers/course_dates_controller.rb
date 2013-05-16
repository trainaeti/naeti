class CourseDatesController < ApplicationController
  before_filter :authenticate_admin
  
  # GET /course_dates
  # GET /course_dates.xml
  def index
    @course_dates = CourseDate.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @course_dates }
    end
  end

  # GET /course_dates/1
  # GET /course_dates/1.xml
  def show
    @course_date = CourseDate.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @course_date }
    end
  end

  # GET /course_dates/new
  # GET /course_dates/new.xml
  def new
    @course_date = CourseDate.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @course_date }
    end
  end

  # GET /course_dates/1/edit
  def edit
    @course_date = CourseDate.find(params[:id])
  end

  # POST /course_dates
  # POST /course_dates.xml
  def create
    @course_date = CourseDate.new(params[:course_date])

    respond_to do |format|
      if @course_date.save
        @course_dates = CourseDate.where(:course_id=>@course_date.course_id)
        format.html { redirect_to(@course_date, :notice => 'Course date was successfully created.') }
        format.xml  { render :xml => @course_date, :status => :created, :location => @course_date }
        format.js {}
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @course_date.errors, :status => :unprocessable_entity }
        format.js {}
      end
    end
  end

  # PUT /course_dates/1
  # PUT /course_dates/1.xml
  def update
    @course_date = CourseDate.find(params[:id])

    respond_to do |format|
      if @course_date.update_attributes(params[:course_date])
        @course_dates = CourseDate.where(:course_id=>@course_date.course_id)
        format.html { redirect_to(@course_date, :notice => 'Course date was successfully updated.') }
        format.xml  { head :ok }
        format.js {}
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @course_date.errors, :status => :unprocessable_entity }
        format.js {}
      end
    end
  end

  # DELETE /course_dates/1
  # DELETE /course_dates/1.xml
  def destroy
    @course_date = CourseDate.find(params[:id])
    @course_date.destroy

    respond_to do |format|
      @course_dates = CourseDate.where(:course_id=>@course_date.course_id)
      format.html { redirect_to(course_dates_url) }
      format.xml  { head :ok }
      format.js {}
      
    end
  end
end
