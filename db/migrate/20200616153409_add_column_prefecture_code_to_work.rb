class AddColumnPrefectureCodeToWork < ActiveRecord::Migration[5.2]
  def up
    add_column :works, :prefecture_code, :integer
  end

  def down
    remove_column :works, :prefecture_code, :integer
  end
end
