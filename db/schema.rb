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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150527020008) do

  create_table "bed_sizes", force: true do |t|
    t.string   "name"
    t.integer  "size_order", default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "housing_types", force: true do |t|
    t.string   "name"
    t.integer  "size_order", default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "neighborhoods", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "payments", force: true do |t|
    t.date     "due"
    t.integer  "amount"
    t.string   "currency",   default: "usd"
    t.boolean  "paid",       default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "photos", force: true do |t|
    t.string   "image_uid"
    t.string   "image_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "post_id"
  end

  create_table "posts", force: true do |t|
    t.decimal  "price"
    t.date     "start_lease"
    t.date     "end_lease"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_uid"
    t.integer  "user_id"
    t.integer  "neighborhood_id"
    t.string   "description",      default: ""
    t.integer  "num_roommates",    default: 0
    t.integer  "num_flatmates",    default: 0
    t.integer  "num_baths",        default: 1
    t.boolean  "heating",          default: false
    t.boolean  "electricity",      default: false
    t.boolean  "hot_water",        default: false
    t.boolean  "parking",          default: false
    t.boolean  "elevator",         default: false
    t.boolean  "balcony",          default: false
    t.boolean  "washer",           default: false
    t.boolean  "dryer",            default: false
    t.boolean  "air_conditioning", default: false
    t.boolean  "doorman",          default: false
    t.boolean  "buzzer",           default: false
    t.boolean  "intercom",         default: false
    t.boolean  "cable",            default: false
    t.boolean  "internet",         default: false
    t.boolean  "smoking",          default: false
    t.boolean  "pool",             default: false
    t.boolean  "gym",              default: false
    t.boolean  "desk",             default: false
    t.boolean  "dresser",          default: false
    t.boolean  "closet",           default: false
    t.integer  "housing_type_id"
    t.integer  "room_type_id"
    t.integer  "bed_size_id"
    t.boolean  "furnished",        default: false
    t.boolean  "unfurnished",      default: false
    t.boolean  "booked",           default: false
  end

  create_table "requests", force: true do |t|
    t.integer  "seller_user_id"
    t.integer  "buyer_user_id"
    t.integer  "post_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "canceled",       default: false
    t.boolean  "confirmed",      default: false
  end

  create_table "room_type", force: true do |t|
    t.string   "name"
    t.integer  "size_order", default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "universities", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "gender"
    t.integer  "university_id"
    t.string   "first_name",             default: ""
    t.string   "last_name",              default: ""
    t.string   "image_uid",              default: "", null: false
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "customer_id"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
