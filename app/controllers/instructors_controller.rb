class InstructorsController < ApplicationController
    
    before_filter :authenticate_instructor
  
    def index
      
      @page_title = 'Instructor Dashboard <span style="font-size:14px">for ' + current_user.name + '</span>'
      @instructor_section = true
      if params[:user]
        
          if current_user.update_attributes(params[:user])
            flash.now[:notice] = "Your password has been updated."
          end
      end
      
    end



    
  
end
