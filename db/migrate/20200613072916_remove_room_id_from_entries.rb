class RemoveRoomIdFromEntries < ActiveRecord::Migration[5.2]
  def up
    remove_column :entries, :room_id, :integer
  end

  def down
    add_column :entries, :room_id, :integer
  end
end
