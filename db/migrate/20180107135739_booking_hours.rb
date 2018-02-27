class BookingHours < ActiveRecord::Migration[5.1]
  def up
    create_table :booking_hours do |t|
      t.time "start"
      t.time "end"
    end
  end

  def down
    drop_table :booking_hours
  end
end
