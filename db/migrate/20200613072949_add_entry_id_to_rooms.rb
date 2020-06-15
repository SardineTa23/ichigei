class AddEntryIdToRooms < ActiveRecord::Migration[5.2]
  def up
    add_column :rooms, :entry_id, :integer, null: false
  end

  def down
    remove_column :rooms, :entry_id, :integer
  end
end
