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

ActiveRecord::Schema.define(version: 20180102235024) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admin_users", force: :cascade do |t|
    t.string "name", limit: 25
    t.string "surename", limit: 40
    t.string "admin_nick", limit: 20
    t.string "email", limit: 100, default: "", null: false
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["admin_nick"], name: "index_admin_users_on_admin_nick"
  end

  create_table "bookings", force: :cascade do |t|
    t.string "customer_name", limit: 25
    t.string "customer_surename", limit: 40
    t.string "customer_nick", limit: 20
    t.integer "table_id"
    t.string "guests_quantity", null: false
    t.date "booking_data"
    t.time "booking_time_start"
    t.time "booking_time_end"
    t.string "comment", limit: 250
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_surename"], name: "index_bookings_on_customer_surename"
  end

  create_table "customers", force: :cascade do |t|
    t.string "name", limit: 25
    t.string "surename", limit: 40
    t.string "customer_nick", limit: 20
    t.string "email", limit: 100, default: "", null: false
    t.string "phone_no", null: false
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_nick"], name: "index_customers_on_customer_nick"
  end

  create_table "tables", force: :cascade do |t|
    t.string "table_type"
    t.string "guests_quantity"
  end

end
