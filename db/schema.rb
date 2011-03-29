# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20091123052337) do

  create_table "activities", :force => true do |t|
    t.string   "activity_type"
    t.string   "title"
    t.string   "description"
    t.integer  "resort_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "activities", ["resort_id"], :name => "index_activities_on_resort_id"

  create_table "admin_sessions", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username"
    t.string   "password"
  end

  create_table "admins", :force => true do |t|
    t.string   "username"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email"
  end

  create_table "amenities", :force => true do |t|
    t.string   "name"
    t.integer  "resort_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_dining"
  end

  add_index "amenities", ["resort_id"], :name => "index_amenities_on_resort_id"

  create_table "bookings", :force => true do |t|
    t.integer  "user_id"
    t.integer  "suite_id"
    t.string   "reference_number"
    t.date     "arrival_date"
    t.date     "departure_date"
    t.boolean  "approved"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "adult_count"
    t.string   "child_count"
    t.string   "price"
    t.time     "payment_received"
    t.string   "additional_adults"
    t.boolean  "cancelled"
    t.boolean  "terms"
  end

  add_index "bookings", ["reference_number"], :name => "index_bookings_on_reference_number"
  add_index "bookings", ["suite_id"], :name => "index_bookings_on_suite_id"
  add_index "bookings", ["user_id"], :name => "index_bookings_on_user_id"

  create_table "dinings", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "resort_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "dinings", ["resort_id"], :name => "index_dinings_on_resort_id"

  create_table "payment_notifications", :force => true do |t|
    t.text     "params"
    t.integer  "booking_id"
    t.string   "status"
    t.string   "transaction_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "payment_fee"
    t.string   "payment_date"
    t.string   "payer_email"
    t.string   "reference_number"
    t.string   "pending_reason"
  end

  add_index "payment_notifications", ["booking_id"], :name => "index_payment_notifications_on_booking_id"

  create_table "resort_locations", :force => true do |t|
    t.string   "location_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "location_pic_file_name"
    t.string   "location_pic_content_type"
    t.integer  "location_pic_file_size"
    t.datetime "location_pic_updated_at"
    t.string   "resort_title"
    t.string   "permalink"
    t.string   "keywords"
    t.text     "meta_description"
  end

  create_table "resorts", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "resort_location_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "from_price"
    t.string   "resort_pic_file_name"
    t.string   "resort_pic_content_type"
    t.integer  "resort_pic_file_size"
    t.datetime "resort_pic_updated_at"
    t.boolean  "adults_only"
    t.string   "permalink"
    t.string   "keywords"
    t.text     "meta_description"
  end

  add_index "resorts", ["name"], :name => "index_resorts_on_name"
  add_index "resorts", ["resort_location_id"], :name => "index_resorts_on_resort_location_id"

  create_table "services", :force => true do |t|
    t.string   "name"
    t.integer  "resort_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "services", ["resort_id"], :name => "index_services_on_resort_id"

  create_table "suite_specs", :force => true do |t|
    t.integer  "suite_id"
    t.string   "spec"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "suite_specs", ["suite_id"], :name => "index_suite_specs_on_suite_id"

  create_table "suites", :force => true do |t|
    t.string   "suite_name"
    t.string   "suite_view"
    t.integer  "resort_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "suite_pic_file_name"
    t.string   "suite_pic_content_type"
    t.integer  "suite_pic_file_size"
    t.datetime "suite_pic_updated_at"
    t.string   "price"
    t.string   "additional_adult"
    t.string   "additional_child"
    t.text     "suite_disclaimer"
    t.string   "permalink"
    t.string   "keywords"
    t.text     "meta_description"
  end

  add_index "suites", ["resort_id"], :name => "index_suites_on_resort_id"

  create_table "user_sessions", :force => true do |t|
    t.string   "username"
    t.string   "password"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "phone"
    t.string   "username"
    t.string   "fullname"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token"
    t.datetime "last_login_at"
    t.boolean  "demo_user"
  end

end
