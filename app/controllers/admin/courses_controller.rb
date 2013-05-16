class Admin::CoursesController < ApplicationController

  before_filter :authenticate_admin
  
  # GET /courses
  # GET /courses.xml
  def index
    @admin_section = true
    #@courses = Course.paginate(:all, :per_page=>10, :page=>params[:page])
    @courses = Course.page(params[:page]).per(10)  

    @course_category_id = ""
    @admin_section = true
    @page_title = "Courses"
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @courses }
    end
  end

  
  # GET /courses/1
  # GET /courses/1.xml
  def show
  
    @admin_section = true
    @course = Course.where(:id=>params[:id]).first
    @tabs = true

    @page_title = @course.title unless @course.blank?

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @course }
    end
  end
    
  def search
    @admin_section = true
    @page_title = "Courses"
    @admin_section = true
    @course_category_id = ""
    @course_date_id = ""
    
      search_term = '%' + params[:search_term] + '%'
      @courses = Course.active.by_search_term(search_term)
      if params[:course][:course_category_id] != ''
        @course_category_id = params[:course][:course_category_id]
        @courses = @courses.where(:course_category_id=>params[:course][:course_category_id])
      end
      
     # if params[:course][:course_date_id] != ''
     #   @course_date_id = params[:course][:course_date_id]
     #   @courses = @courses.by_course_date_id(params[:course][:course_date_id])
     # end
      
      #@courses = @courses.paginate(:per_page=>10, :page=>params[:page])
     # @courses = @courses.page(params[:page]).per(10)  
      render :action=>"index"  
  end

  def export_xls
    @course = Course.find(params[:course_id])
    datestamp = Time.now.month.to_s + Time.now.day.to_s + Time.now.year.to_s[2,4]
    headers['Content-Type'] = "application/vnd.ms-excel"
    headers['Content-Disposition'] = 'attachment; filename="course-' + @course.id.to_s + "-" + datestamp + '.xls"'
    headers['Cache-Control'] = ''
    render :layout=>"blank"
   
  end
  
  def export_pdf
    @course = Course.find(params[:course_id])    
    render :layout=>"blank"
  end
  
  def export_emails
    @course = Course.find(params[:course_id])
    datestamp = Time.now.month.to_s + Time.now.day.to_s + Time.now.year.to_s[2,4]
    headers['Content-Type'] = "application/vnd.ms-excel"
    headers['Content-Disposition'] = 'attachment; filename="course-emails-' + @course.id.to_s + "-" + datestamp + '.xls"'
    headers['Cache-Control'] = ''
    render :layout=>"blank"
  end
  
  def admin_instructor_edit

      @course = Course.find(params[:course_id])
      @course_asset = CourseAsset.new
      
      if params[:course_asset]
        @course_asset = CourseAsset.new(params[:course_asset])
        if @course_asset.valid?
          @course_asset.save
          @course.course_assets << @course_asset
          flash.now[:notice] = "The document has been uploaded."
          @course_asset = CourseAsset.new
          
        else
          flash.new[:notice] = "There was a problem with your submission."
        end
      end
            
      @page_title = @course.title
      @tabs = true
      if request.url.include? "instructors"
        @instructor_section = true
      else
        @admin_section = true
      end
    
      respond_to do |format|
        format.html # show.html.erb
        format.xml  { render :xml => @course }
      end
    
  end
  
  
  #DRY UP THE NEXT TWO ACTIONS
  def instructor_list
    #NEED TO ADD CURRENT USER
    @courses = Course.where(:instructor_id=>current_user.id).paginate(:per_page=>10, :page=>params[:page])
    @course_category_id = ""
    @instructor_section = true
    @page_title = 'Courses for <span style="font-size:14px">for ' + current_user.name + '</span>'

    render  :action=>"/courses/index"
  end
  

  def instructor_search
    @page_title = 'Courses for <span style="font-size:14px">for John Doe</span>'
    @instructor_section = true
    @course_category_id = ""
    @course_date_id = ""

      search_term = '%' + params[:search_term] + '%'
      @courses = Course.where(:instructor_id=>current_user.id).by_search_term(search_term)
      if params[:course][:course_category_id].present?
        @course_category_id = params[:course][:course_category_id]
        @courses = @courses.where(:course_category_id=>params[:course][:course_category_id])
      end

      if params[:course][:course_date_id].present?
        @course_date_id = params[:course][:course_date_id]
        @courses = @courses.by_course_date_id(params[:course][:course_date_id])
      end

      @courses = @courses.paginate(:per_page=>10, :page=>params[:page])
      render :action=>"/courses/index"  
  end

  # GET /courses/new
  # GET /courses/new.xml
  def new
    @course = Course.new
    @course.active = true
    @course_date = CourseDate.new 
     
    @admin_section = true
    @page_title = "Create New Course"

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @course }
    end
  end

  # GET /courses/1/edit
  def edit
    @admin_section = true
    @page_title = "Edit Course"
    @course = Course.find(params[:id])
    @course_dates = CourseDate.where(:course_id=>@course.id)
    
    @course_date = CourseDate.new 
    
  end

  # POST /courses
  # POST /courses.xml
  def create
    @course = Course.new(params[:course])
    @admin_section = true
    @page_title = "Create New Course"
       
    respond_to do |format|
      if @course.save
        format.html { redirect_to(admin_courses_url, :notice => 'Course was successfully created.') }
        format.xml  { render :xml => @course, :status => :created, :location => @course }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @course.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /courses/1
  # PUT /courses/1.xml
  def update
    @page_title = "Edit User"
    @admin_section = true        
    upload if params[:id]=="upload"
    
    params[:course_id].present? ? @course = Course.where(:id=>params[:course_id]).first :  @course = Course.where(:id=>params[:id]).first 

    respond_to do |format|
      if params[:course].present?
        if @course.update_attributes(params[:course])
          format.html { redirect_to(admin_courses_url, :notice => 'Course was successfully updated.')}
          format.xml  { head :ok }
        else
          format.html { render :action => "edit" }
          format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
        end
      else
        if @course_asset.save
          format.html { redirect_to(admin_course_path(@course.id), :notice => 'Course was successfully uploaded.') }
          format.xml  { head :ok }  
          format.js {}
        else
          format.html {  }
          format.xml  { render :xml => @user_asset.errors, :status => :unprocessable_entity }        
        end
        
      end
      
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.xml
  def destroy
    @course = Course.where(:id=>params[:id]).first()
    @course.destroy

    respond_to do |format|
      format.html { redirect_to(admin_courses_url) }
      format.xml  { head :ok }
    end
  end

  def upload
    @admin_section = true
    @course_asset = CourseAsset.new
    @course_asset.course_id = params[:course_id] 
    @course_asset.title = params[:Filename]
    @course_asset.description = params[:Filename]
    @course_asset.asset = params[:Filedata]
  end

  def send_reminder
    @order_items = OrderItem.where(:course_date_id=>params[:course_date][:id])
    respond_to do |format|
      format.js {
        @order_items.each do |order_item |             
          Postoffice.delay.class_reminder(order_item.registrant.email, params[:message])

        end
      }
    end
  end
end
