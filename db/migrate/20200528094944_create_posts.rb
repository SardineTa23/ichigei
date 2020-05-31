class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.integer :user_id, null: false
      t.integer :category_id
      t.string :image_id
      t.string :title, null: false, default: ""
      t.string :content, null: false, default: ""
      t.string :url, null: false, default: ""

      t.timestamps
    end
  end
end
