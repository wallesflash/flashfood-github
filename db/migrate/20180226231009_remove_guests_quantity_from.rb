class RemoveGuestsQuantityFrom < ActiveRecord::Migration[5.1]
  def up
    remove_column :bookings, :guests_quantity, :string
  end

  def down
    add_column :bookings, :guests_quantity, :string
  end
end
