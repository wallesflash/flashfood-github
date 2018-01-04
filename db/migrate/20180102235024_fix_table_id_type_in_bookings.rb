class FixTableIdTypeInBookings < ActiveRecord::Migration[5.1]
  def up
    change_column :bookings, :table_id, 'integer USING CAST(table_id AS integer)'
  end
end
