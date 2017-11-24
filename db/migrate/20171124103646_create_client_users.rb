class CreateClientUsers < ActiveRecord::Migration[5.1]
  def up
    create_table :client_users do |t|
      t.string "name", :limit => 25
      t.string "surename", :limit => 40
      t.string "client_nick", :limit => 20
      t.string "email", :limit => 100, :default => "", :null => false
      t.string "phone_no", :null => false
      t.string "password_digest"

      t.timestamps
    end
    add_index("client_users", "client_nick")
  end
  def down
    drop_table :client_users
  end
end
