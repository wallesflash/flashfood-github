class CreateBookings < ActiveRecord::Migration[5.1]
  def up
    create_table :bookings do |t|
      t.string "customer_name", :limit => 25
      t.string "customer_surename", :limit => 40
      t.string "customer_nick", :limit => 20
      t.integer "table_id"
      t.date "booking_data"
      t.time "booking_hour_start"
      t.time "booking_hour_end"
      t.string "comment", :limit => 250

      t.timestamps
    end
    add_index("bookings", "customer_surename")
  end
  def down
    drop_table :bookings
  end
end
