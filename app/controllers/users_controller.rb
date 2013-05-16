class UsersController < ApplicationController
  
  before_filter :authenticate_admin, :only=>[:index, :new, :create, :destroy]
  
  # GET /users
  # GET /users.xml
  def index
    @page_title = "Users"
    @admin_section = true
    
    @users = User.paginate(:all,:per_page=>20, :page=>params[:page])
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
      format.csv  { 
        @users = User.where(:admin=>true) if params[:role_id]=='admin'
        @users = User.where(:instructor=>true) if params[:role_id]=='instructor'
        @users = User.where(:instructor=>false).where(:admin=>false) if params[:role_id]=='general'
        export_to_csv(@users)
      }
    end
  end
  
  def search
    @page_title = "Users"
    
    @admin_section = true
      search_term = '%' + params[:search_term] + '%'
      @users = User.by_search_term(search_term)
      if params[:role]
        @users = @users.admins if params[:role] == "admin"
        @users = @users.instructors if params[:role] == "instructor"
        @users = @users.general if params[:role] == "general"
      end
      
      @users = @users.paginate(:per_page=>20, :page=>params[:page])
      render :action=>"index"  
    
  end

  # GET /users/1
  # GET /users/1.xml
  def show
    @page_title = "User Details"
    
    @admin_section = true
    @tabs = true
    
    @user = User.find(params[:id])
    
    @user_asset = UserAsset.new
    @user_asset.user_id = @user.id 
     
    @courses = Course.where(:instructor_id=>@user.id) if @user.instructor?
    @course_dates = CourseDate.where(:user_id=>@user.id) if @user.instructor?
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
    end
  end
  
  def add_to_course
    @admin_section = true
    @tabs = true
    
    @page_title = "Add User to Course"
    
    
    @course = Course.find(params[:course_id]) if params[:course_id]
    @user = User.find(params[:user_id])
    
    if params[:course_date_id]
      @course_date = CourseDate.find(params[:course_date_id])
      
      order = Order.create(:user_id=>@user.id,  :total=>0)
      order_item = OrderItem.create(:course_id=>@course_date.course_id, :course_date_id=>params[:course_date_id],:offline_transaction_notes=>params[:offline_transaction_notes])
      order.order_items << order_item
      
      @course_registrant = CourseRegistrant.create(:course_id=>@course_date.course_id, :course_date_id=>params[:course_date_id], :registration_date=>Time.now().to_date, :user_id=>@user.id)
      redirect_to "/users/" + @user.id.to_s
    end
  end

  # GET /users/new
  # GET /users/new.xml
  def new
  
    @page_title = "Create New User"
    @admin_section = true
    
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/1/edit
  def edit
    @admin_section = true
    @page_title = "Edit User"
    
    @user = User.find(params[:id])
  end

  def user_admin
    
    @page_title = "Create New User"
    @admin_section = true
    
    @user = User.new(params[:user])

    #need to refactor this
    if params[:role] == 'admin'
      @user.instructor = false
      @user.admin = true
    end
    if params[:role] == 'instructor'
      @user.instructor = true
      @user.admin = false
    end
    if params[:role] == 'general'
      @user.instructor = false
      @user.admin = false
    end
    
    respond_to do |format|
      if @user.save
        format.html { redirect_to(user_path(@user), :notice => 'User was successfully created.') }
        format.xml  { render :xml => @user, :status => :created, :location => @user }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end

  end
  
  # POST /users
  # POST /users.xml
  def create
    @page_title = "Create New User"
    @admin_section = true
    
    @user = User.new(params[:user])

    #need to refactor this
    if params[:role] == 'admin'
      @user.instructor = false
      @user.admin = true
    end
    if params[:role] == 'instructor'
      @user.instructor = true
      @user.admin = false
    end
    if params[:role] == 'general'
      @user.instructor = false
      @user.admin = false
    end
    
    respond_to do |format|
      if @user.save
        format.html { redirect_to(@user, :notice => 'User was successfully created.') }
        format.xml  { render :xml => @user, :status => :created, :location => @user }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.xml
  def update
    @page_title = "Edit User"
    @admin_section = true
    
    upload if params[:id]=="upload"
    
    params[:user_id].present? ? @user = User.find(params[:user_id]) :  @user = User.find(params[:id]) 
    
    #need to refactor this
    if params[:role] == 'admin'
      @user.instructor = false
      @user.admin = true
    end
    if params[:role] == 'instructor'
      @user.instructor = true
      @user.admin = false
    end
    if params[:role] == 'general'
      @user.instructor = false
      @user.admin = false
    end
    
    respond_to do |format|
      
      if params[:user].present?
        if @user.update_attributes(params[:user])
        #  @user.save!
          format.html { redirect_to(user_path(@user.id), :notice => 'User was successfully updated.') }
          format.xml  { head :ok }
        else
          format.html { render :action => "edit" }
          format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
        end
      else
        if @user_asset.save
          format.html { redirect_to(user_path(@user.id), :notice => 'User was successfully updated.') }
          format.xml  { head :ok }  
          format.js    
        else
          format.html {  }
          format.xml  { render :xml => @user_asset.errors, :status => :unprocessable_entity }        
        end
        
      end
      
    end
  end

  
  # DELETE /users/1
  # DELETE /users/1.xml
  def destroy
  
    @user = User.where(:id=>params[:id]).first
    @user.destroy

    respond_to do |format|
      format.html { redirect_to(users_path) }
      format.xml  { head :ok }
    end
  end
  
  def upload
    @admin_section = true
    @user_asset = UserAsset.new
    @user_asset.user_id = params[:user_id] 
    @user_asset.title = params[:Filename]
    @user_asset.description = params[:Filename]
    @user_asset.asset = params[:Filedata]
  end

  private
  
  def export_to_csv users

    csv_string = FasterCSV.generate do |csv|
      # header row
      csv << ["Company Name", "First Name", "Last Name", "Address", "City", "State", "Zip", "Email", "Phone", "Cell", "Date Registered"]

      # data rows
      users.each do |user|
        begin
          csv << [user.company_name, user.first_name, user.last_name, user.address, user.city, State.where(:id=>user.state_id).first.name, user.zip, user.email, user.phone, user.cell, user.created_at.strftime("%m/%d/%y")]
        rescue 
          csv << [user.company_name, user.first_name, user.last_name, user.address, user.city, State.where(:id=>user.state_id).first.name, user.zip, user.email, user.phone, user.cell, 'none']
        end
        
      end
    end

    # send it to the browsah
    send_data csv_string,
              :type => 'text/csv; charset=iso-8859-1; header=present',
              :disposition => "attachment; filename=#{params[:role_id]}_list_[#{Time.now.strftime('%Y_%m_%d')}].csv"
  end
  
      
end
