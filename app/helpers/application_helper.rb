module ApplicationHelper
  
  def format_price(price)
    "$" + sprintf("%4.2f",price)
  end
  
  def show_course_dates(course)
    output = ""
    for course_date in course.course_dates
	  output += course_date.start_date.strftime('%a %b %d, %Y').to_s + " - " + course_date.end_date.strftime('%a %b %d, %Y').to_s + "<br>"
    end
	raw output
  end

  def get_role(user)
    return "Admin" if user.admin
    return "Instructor" if user.instructor
    return "General" if !user.instructor && !user.admin     
  end
  
  def roles
    roles = [
      ["View All", "all"],
      ["Administrator", "admin"],
      ["Instructor", "instructor"],
      ["General User", "general"]
    ]
  end

  def truncate_words(text, length = 30, end_string = ' ...')
    words = text.split()
    words[0..(length-1)].join(' ') + (words.length > length ? end_string : '')
  end
  
end
