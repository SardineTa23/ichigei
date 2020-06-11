class AddColumnRoomIdToEntry < ActiveRecord::Migration[5.2]
  def up
    add_column :entries, :room_id, :integer
  end

  def down
    remove_column :entries, :room_id, :integer
  end
end
