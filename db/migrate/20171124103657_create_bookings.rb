class CreateBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :bookings do |t|
      t.string "client_name", :limit => 25
      t.string "client_surename", :limit => 40
      t.string "client_nick", :limit => 20
      t.string "table_no"
      t.string "guests_quantity", :null => false
      t.date "booking_data"
      t.time "booking_time"
      t.string "comment", :limit => 250

      t.timestamps
    end
    add_index("bookings", "client_surename")
  end
  def down
    drop_table :bookings
  end
end