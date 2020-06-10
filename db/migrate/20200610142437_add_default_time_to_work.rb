class AddDefaultTimeToWork < ActiveRecord::Migration[5.2]
  def down
    change_column :works, :started_at, :datetime
    change_column :works, :ended_at, :datetime
  end

  def up
    change_column :works, :started_at, :datetime,  default: -> { 'NOW()' }
    change_column :works, :ended_at, :datetime,  default: -> { 'NOW()' }
  end
end
