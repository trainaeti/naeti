class Admin::RegistrantsController < ApplicationController
  before_filter :authenticate_admin

  # GET /assets
  # GET /assets.xml
  def index
  
   # @registrants = Registrant.all
    @order_items = OrderItem.confirmed.where(:course_date_id=>params[:course_date])
    @admin_section = true

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @order_items }
      format.csv { export_to_csv(@order_items) }
    end
  end

  private
  
  def export_to_csv order_items

    csv_string = FasterCSV.generate do |csv|
      # header row
      csv << ["Company Name", "First Name", "Last Name", "Address", "City", "State", "Zip", "Email", "Phone", "Cell", "Date Registered"]

      # data rows
      order_items.each do |order_item|
        csv << [order_item.registrant.company_name, order_item.registrant.first_name, order_item.registrant.last_name, order_item.registrant.address, order_item.registrant.city, State.where(:id=>order_item.registrant.state_id).first.name, order_item.registrant.zip, order_item.registrant.email, order_item.registrant.phone, order_item.registrant.cell, order_item.registrant.created_at.strftime("%m/%d/%y")]
      end
    end

    # send it to the browsah
    send_data csv_string,
              :type => 'text/csv; charset=iso-8859-1; header=present',
              :disposition => "attachment; filename=Registratants_[#{Time.now.strftime('%Y_%m_%d')}].csv"
  end
  
end
