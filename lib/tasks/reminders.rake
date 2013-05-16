

require 'parsedate'

namespace :reminders do

  desc "Remind users of upcoming courses"
  task :courses => :environment do
    
    for course in Course.all
      for course_date in course.course_dates
        if (Time.now.to_date() + course_date.reminder_days.days)
          
        end   
      end
    end
  
  end


end

