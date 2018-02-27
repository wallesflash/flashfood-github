class AddIndexToCustomerNick < ActiveRecord::Migration[5.1]
  def up
    add_index :customers, :customer_nick, unique: true
    change_column :customers, :customer_nick, :string, null: false
  end

  def down
    remove_index :customers, :customer_nick
    change_column :customers, :customer_nick, :string, null: true
  end
end
