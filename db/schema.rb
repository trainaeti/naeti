# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110726194605) do

  create_table "assets", :force => true do |t|
    t.string   "asset_file_name"
    t.string   "asset_content_type"
    t.integer  "asset_file_size"
    t.datetime "asset_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "content_blocks", :force => true do |t|
    t.string   "name"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "friendly_url"
  end

  create_table "course_assets", :force => true do |t|
    t.integer  "course_id"
    t.string   "title"
    t.text     "description"
    t.string   "asset_file_name"
    t.string   "asset_content_type"
    t.integer  "asset_file_size"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "course_categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "order"
  end

  create_table "course_dates", :force => true do |t|
    t.integer  "course_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "course_date"
    t.integer  "class_size"
    t.integer  "reminder_days"
    t.date     "start_date"
    t.date     "end_date"
    t.string   "sku"
    t.integer  "user_id"
    t.string   "pdf_location"
  end

  create_table "course_registrants", :force => true do |t|
    t.integer  "course_id"
    t.integer  "user_id"
    t.string   "status"
    t.date     "registration_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "course_date_id"
    t.integer  "registrant_id"
  end

  create_table "course_users", :force => true do |t|
    t.integer  "user_id"
    t.integer  "course_id"
    t.boolean  "instructor"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "courses", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.decimal  "price",              :precision => 10, :scale => 0
    t.string   "Duration"
    t.text     "Locations"
    t.integer  "instructor_id"
    t.boolean  "active"
    t.text     "prerequisites"
    t.integer  "course_category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "friendly_url"
    t.integer  "order"
    t.string   "pdf_location"
  end

  create_table "credit_card_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "delayed_jobs", :force => true do |t|
    t.integer  "priority",   :default => 0
    t.integer  "attempts",   :default => 0
    t.text     "handler"
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], :name => "delayed_jobs_priority"

  create_table "instructorships", :force => true do |t|
    t.integer  "course_date_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "on_site_trainings", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "order_items", :force => true do |t|
    t.integer  "order_id"
    t.integer  "course_id"
    t.integer  "course_date_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "registrant_id"
    t.boolean  "is_confirmed"
    t.boolean  "is_www"
    t.boolean  "is_purchaseorder"
    t.boolean  "is_offline"
    t.string   "po_number"
  end

  create_table "order_transactions", :force => true do |t|
    t.integer  "order_id"
    t.string   "action"
    t.integer  "amount"
    t.boolean  "success"
    t.string   "authorization"
    t.string   "message"
    t.text     "params"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orders", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "ip_address"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "address"
    t.string   "city"
    t.integer  "state_id"
    t.string   "zip"
    t.string   "card_type"
    t.date     "card_expires_on"
    t.integer  "shopping_cart_id"
    t.string   "email"
    t.string   "phone"
  end

  create_table "registrants", :force => true do |t|
    t.string   "company_name"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "address"
    t.string   "city"
    t.integer  "state_id"
    t.string   "zip"
    t.string   "email"
    t.string   "phone"
    t.string   "cell"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_terms"
    t.boolean  "is_paid"
    t.boolean  "is_creditcard"
    t.boolean  "is_purchaseorder"
    t.boolean  "is_phone"
    t.string   "payment_description"
  end

  create_table "shopping_cart_items", :force => true do |t|
    t.integer  "shopping_cart_id"
    t.integer  "course_id"
    t.integer  "course_date_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "registrant_id"
  end

  create_table "shopping_carts", :force => true do |t|
    t.string   "session_id"
    t.integer  "user_id"
    t.decimal  "total",        :precision => 10, :scale => 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "purchased_at"
  end

  create_table "states", :force => true do |t|
    t.string   "name"
    t.string   "abbreviation"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_assets", :force => true do |t|
    t.integer  "user_id"
    t.string   "title"
    t.text     "description"
    t.string   "asset_file_name"
    t.string   "asset_content_type"
    t.integer  "asset_file_size"
    t.datetime "asset_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_roles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                                  :default => "", :null => false
    t.string   "encrypted_password",      :limit => 128, :default => "", :null => false
    t.string   "password_salt",                          :default => "", :null => false
    t.string   "reset_password_token"
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "phone"
    t.integer  "user_role_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin"
    t.boolean  "instructor"
    t.string   "title"
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.string   "suffix"
    t.date     "date_of_birth"
    t.string   "social_security_number"
    t.string   "cell"
    t.string   "address2"
    t.string   "company_link"
    t.string   "company_name"
    t.string   "company_phone"
    t.string   "company_phone_extension"
    t.string   "picture_file_name"
    t.string   "courses_taken_link"
    t.string   "in_case_of_emergency"
    t.string   "student_status"
    t.integer  "instructor_id"
    t.integer  "state_id"
    t.integer  "credit_card_type_id"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "waitinglists", :force => true do |t|
    t.string   "email"
    t.integer  "course_date_id"
    t.boolean  "is_contacted"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
