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

ActiveRecord::Schema.define(version: 20171208203735) do

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
    t.string "client_name", limit: 25
    t.string "client_surename", limit: 40
    t.string "client_nick", limit: 20
    t.string "table_no"
    t.string "guests_quantity", null: false
    t.date "booking_data"
    t.time "booking_time"
    t.string "comment", limit: 250
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_surename"], name: "index_bookings_on_client_surename"
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

end
