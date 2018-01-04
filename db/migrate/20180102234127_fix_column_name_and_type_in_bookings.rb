class FixColumnNameAndTypeInBookings < ActiveRecord::Migration[5.1]
  def up
    rename_column :bookings, :table_no, :table_id
  end
end
