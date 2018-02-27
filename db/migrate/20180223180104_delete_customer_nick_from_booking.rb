class DeleteCustomerNickFromBooking < ActiveRecord::Migration[5.1]
  def change
    remove_column :bookings, :customer_nick, :string
  end
end
