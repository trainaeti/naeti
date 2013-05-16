class CoursesController < ApplicationController

  # GET /courses
  # GET /courses.xml
  def index
     @course_category = CourseCategory.where(:id=>params[:course_category_id]).first unless params[:course_category_id].blank?

     if @course_category
       @courses = Course.active.where(:course_category_id=>params[:course_category_id]).page(params[:page]).per(10)
       #@courses = Course.active.where(:course_category_id=>params[:course_category_id]).paginate(:all, :per_page=>10, :page=>params[:page])     
     else
       @courses = Course.active.page(params[:page]).per(10)  
     end          
     @page_title = "NAETI Course Categories"
     
     respond_to do |format|
       format.html { @courses } # show.html.erb
       format.xml  { render :xml => @courses }
       format.js  { }

     end
  end
   
  def register
    
    @course = Course.find(params[:friendly_course_url])
    @page_title = "Register for " + @course.title
    @registrant = Registrant.new(params[:registrant])
    
    if request.post?
    
      if @registrant.save
        course_date = CourseDate.where(:id=>params[:course_date][:id]).first()
        retrieve_shopping_cart
        if add_to_cart(@course, course_date, @registrant)
          redirect_to new_order_path
        end     
      else
        respond_to do |format|
          format.html { render :action => "register"  }
          format.xml  { render :xml => @course }      
        end
        
      end
      
    end
  end
  
  # GET /courses/1
  # GET /courses/1.xml
  def show
    @course = Course.where(:id=>params[:id]).first

    @page_title = @course.title unless @course.blank?

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @course }
    end
  end
  
end
