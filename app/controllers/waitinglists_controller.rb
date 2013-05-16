class WaitinglistsController < ApplicationController
  before_filter :authenticate_admin, :only=>[:index]
  # GET /waitinglists
  # GET /waitinglists.xml
  def index
    @admin_section = true
    @waitinglists = Waitinglist.where(:course_date_id=>params[:course_date])
    @course = CourseDate.where(:id=>params[:course_date]).first
    
    respond_to do |format|
      #format.html # index.html.erb
      format.xml  { render :xml => @waitinglists }
      format.csv { export_to_csv(@waitinglists, @course) }
    end
  end

  # GET /waitinglists/new
  # GET /waitinglists/new.xml
  def new
    @waitinglist = Waitinglist.new
    @waitinglist.course_date_id = params[:course_date_id]
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @waitinglist }
    end
  end

  # POST /waitinglists
  # POST /waitinglists.xml
  def create
    @waitinglist = Waitinglist.new(params[:waitinglist])
    @course = CourseDate.where(:id=>params[:waitinglist][:course_date_id]).first.course_id
    
    respond_to do |format|
      if @waitinglist.save
        format.html { redirect_to(course_path(@course), :notice => 'Thank you for registering for the waiting list.') }
        format.xml  { render :xml => @waitinglist, :status => :created, :location => @waitinglist }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @waitinglist.errors, :status => :unprocessable_entity }
      end
    end
  end

  private
  
  def export_to_csv(waitinglists, current_course)

    csv_string = FasterCSV.generate do |csv|
      # header row
      csv << ["Email", "Course Title", "Start Date", "End Date"]

      # data rows
      waitinglists.each do |waitinglist|
        csv << [waitinglist.email, current_course.course.title, current_course.start_date, current_course.end_date ]
      end
    end

    # send it to the browsah
    send_data csv_string,
              :type => 'text/csv; charset=iso-8859-1; header=present',
              :disposition => "attachment; filename=Waiting_List_[#{Time.now.strftime('%Y_%m_%d')}].csv"
  end

end
