class AddColumnToEntry < ActiveRecord::Migration[5.2]
  def up
    add_column :entries, :points_when_applying, :integer, null: false
  end

  def down
    remove_column :entries, :points_when_applying, :integer
  end
end
