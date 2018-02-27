class AddCustomerIdAndPhoneNoToBooking < ActiveRecord::Migration[5.1]
  def change
    add_column :bookings, :customer_id, :integer
    add_column :bookings, :phone_no, :string
  end
end
