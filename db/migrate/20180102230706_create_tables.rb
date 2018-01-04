class CreateTables < ActiveRecord::Migration[5.1]
  def up
    create_table :tables do |t|
      t.string "table_type"
      t.string "guests_quantity"

    end
  end

  def down
    drop_table :tables
  end

end
