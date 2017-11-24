class CreateAdminUsers < ActiveRecord::Migration[5.1]
  def up
    create_table :admin_users do |t|
      t.string "name", :limit => 25
      t.string "surename", :limit => 40
      t.string "admin_nick", :limit => 20
      t.string "email", :limit => 100, :default => "", :null => false
      t.string "password_digest"

      t.timestamps
    end
    add_index("admin_users", "admin_nick")
  end
  def down
    drop_table :admin_users
  end
end
