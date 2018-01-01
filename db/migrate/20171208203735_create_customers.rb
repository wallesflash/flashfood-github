class CreateCustomers < ActiveRecord::Migration[5.1]
  def up
    create_table :customers do |t|
      t.string "name", :limit => 25
      t.string "surename", :limit => 40
      t.string "customer_nick", :limit => 20
      t.string "email", :limit => 100, :default => "", :null => false
      t.string "phone_no", :null => false
      t.string "password_digest"

      t.timestamps
    end
    add_index("customers", "customer_nick")
  end
  def down
    drop_table :customers
  end
end
