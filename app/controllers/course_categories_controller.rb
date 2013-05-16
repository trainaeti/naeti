class CourseCategoriesController < ApplicationController
  before_filter :authenticate_admin
  
  # GET /course_categories
  # GET /course_categories.xml
  def index
    @admin_section = true
    @page_title = "Course Categories"
    
    @course_categories = CourseCategory.paginate(:all, :per_page=>10, :page=>params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @course_categories }
    end
  end

  # GET /course_categories/1
  # GET /course_categories/1.xml
  def show
    @admin_section = true
    @course_category = CourseCategory.find(params[:id])
    @page_title = "Course Category Details"

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @course_category }
    end
  end

  # GET /course_categories/new
  # GET /course_categories/new.xml
  def new
    @admin_section = true
    @course_category = CourseCategory.new
    @page_title = "New Course Category"

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @course_category }
    end
  end

  # GET /course_categories/1/edit
  def edit
    @admin_section = true
    @course_category = CourseCategory.find(params[:id])
    @page_title = "Edit Course Category"
    
  end

  # POST /course_categories
  # POST /course_categories.xml
  def create
    @course_category = CourseCategory.new(params[:course_category])
    @admin_section = true
    @page_title = "New Course Category"
    
    respond_to do |format|
      if @course_category.save
        format.html { redirect_to(course_categories_url, :notice => 'Course category was successfully created.') }
        format.xml  { render :xml => @course_category, :status => :created, :location => @course_category }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @course_category.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /course_categories/1
  # PUT /course_categories/1.xml
  def update
    @course_category = CourseCategory.find(params[:id])
    @admin_section = true
    @page_title = "Edit Course Category"
    
    respond_to do |format|
      if @course_category.update_attributes(params[:course_category])
        format.html { redirect_to(course_categories_url, :notice => 'Course category was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @course_category.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /course_categories/1
  # DELETE /course_categories/1.xml
  def destroy
    @course_category = CourseCategory.find(params[:id])
    @course_category.destroy

    respond_to do |format|
      format.html { redirect_to(course_categories_url) }
      format.xml  { head :ok }
    end
  end
end
