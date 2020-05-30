class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.integer :work_id, null: false 
      t.string :image_id, null: false
      t.timestamps
    end
  end
end
