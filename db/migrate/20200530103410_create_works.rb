class CreateWorks < ActiveRecord::Migration[5.2]
  def change
    create_table :works do |t|
      t.integer :user_id, null: false
      t.integer :category_id
      t.integer :recruitment_status, null: false, default: 0
      t.string :image_id
      t.string :title, null: false
      t.text :description
      t.text :condition
      t.string :postal_code, default: ""
      t.string :address_city, default: "" 
      t.string :address_street, default: "" 
      t.string :address_building, default: "" 
      t.datetime :deleted_at
      t.datetime :started_at
      t.datetime :ended_at
      t.integer :reward
      t.timestamps
    end
  end
end
