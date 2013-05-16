class AdminController < ApplicationController
    before_filter :authenticate_admin
    
    def index
      @page_title = "Admin Home"
      @admin_section = true
      
    end
    
    def reports
      @admin_section = true
      @page_title = "Reports"
      @courses = Course.paginate(:all, :per_page=>10, :page=>params[:page])
      @datestamp = Time.now.month.to_s + Time.now.day.to_s + Time.now.year.to_s[2,4]
      
    end
    

  
end
