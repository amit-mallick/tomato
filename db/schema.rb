# encoding: UTF-8
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

ActiveRecord::Schema.define(:version => 20180609112740) do

  create_table "locations", :force => true do |t|
    t.string   "address"
    t.string   "location"
    t.integer  "resturant_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "locations", ["resturant_id"], :name => "index_locations_on_resturant_id"

  create_table "ratings", :force => true do |t|
    t.string   "commenter"
    t.integer  "rating"
    t.text     "body"
    t.integer  "resturant_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "user_id"
  end

  add_index "ratings", ["resturant_id"], :name => "index_ratings_on_resturant_id"

  create_table "resturants", :force => true do |t|
    t.string   "image"
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "cuisines"
    t.integer  "user_id"
    t.integer  "price"
  end

  create_table "user_sessions", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token"
    t.datetime "created_at",                           :null => false
    t.datetime "updated_at",                           :null => false
    t.boolean  "admin",             :default => false, :null => false
    t.text     "name"
    t.string   "perishable_token",  :default => "",    :null => false
    t.boolean  "verified",          :default => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["perishable_token"], :name => "index_users_on_perishable_token"

  create_table "will_filter_filters", :force => true do |t|
    t.string   "type"
    t.string   "name"
    t.text     "data"
    t.integer  "user_id"
    t.string   "model_class_name"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "will_filter_filters", ["user_id"], :name => "index_will_filter_filters_on_user_id"

end
