class CreateEntries < ActiveRecord::Migration[5.2]
  def change
    create_table :entries do |t|
      t.integer :user_id, null: false
      t.integer :work_id, null: false
      t.integer :working_status, null: false, default: 0
      t.timestamps
    end
  end
end
