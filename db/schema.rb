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

ActiveRecord::Schema.define(:version => 20110418173937) do

  create_table "companies", :force => true do |t|
    t.string   "name"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "state_id"
    t.integer  "country_id"
    t.integer  "sector_id"
  end

  add_index "companies", ["city"], :name => "index_companies_on_city"
  add_index "companies", ["name"], :name => "index_companies_on_name"

  create_table "countries", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", :force => true do |t|
    t.string   "name"
    t.string   "venue"
    t.text     "info"
    t.date     "date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "interests", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "interests_people", :id => false, :force => true do |t|
    t.integer  "person_id"
    t.integer  "interest_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "interests_people", ["interest_id"], :name => "index_interests_people_on_interest_id"
  add_index "interests_people", ["person_id"], :name => "index_interests_people_on_person_id"

  create_table "name_badges", :force => true do |t|
    t.string   "name"
    t.float    "width"
    t.float    "height"
    t.float    "left"
    t.float    "right"
    t.float    "top"
    t.float    "bottom"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "font_size"
  end

  add_index "name_badges", ["name"], :name => "index_name_badges_on_name"

  create_table "people", :force => true do |t|
    t.string   "fname"
    t.string   "lname"
    t.string   "email"
    t.string   "job"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "registration_id"
    t.integer  "company_id"
    t.string   "phone"
    t.boolean  "printed",         :default => false
  end

  add_index "people", ["email"], :name => "index_people_on_email", :unique => true
  add_index "people", ["printed"], :name => "index_people_on_printed"

  create_table "people_promotions", :id => false, :force => true do |t|
    t.integer "person_id"
    t.integer "promotion_id"
  end

  add_index "people_promotions", ["person_id"], :name => "index_people_promotions_on_person_id"
  add_index "people_promotions", ["promotion_id"], :name => "index_people_promotions_on_promotion_id"

  create_table "promotions", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "registrations", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sectors", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sectors", ["name"], :name => "index_sectors_on_name", :unique => true

  create_table "states", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "states", ["name"], :name => "index_states_on_name"

  create_table "users", :force => true do |t|
    t.string   "email",                               :default => "",    :null => false
    t.string   "encrypted_password",   :limit => 128, :default => "",    :null => false
    t.string   "reset_password_token"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin",                               :default => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
