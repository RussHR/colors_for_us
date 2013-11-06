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

ActiveRecord::Schema.define(:version => 20131106220917) do

  create_table "authentications", :force => true do |t|
    t.integer  "user_id",    :null => false
    t.string   "provider",   :null => false
    t.string   "uid",        :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "authentications", ["uid"], :name => "index_authentications_on_uid"

  create_table "favorites", :force => true do |t|
    t.integer  "palette_id", :null => false
    t.integer  "giver_id",   :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "favorites", ["giver_id"], :name => "index_favorites_on_giver_id"
  add_index "favorites", ["palette_id"], :name => "index_favorites_on_palette_id"

  create_table "palettes", :force => true do |t|
    t.string   "color_1",    :null => false
    t.string   "color_2"
    t.string   "color_3"
    t.string   "color_4"
    t.string   "color_5"
    t.integer  "creator_id", :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "name"
  end

  add_index "palettes", ["creator_id"], :name => "index_palettes_on_creator_id"

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0,  :null => false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
