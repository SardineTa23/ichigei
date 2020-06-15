class CreatePortfolios < ActiveRecord::Migration[5.2]
  def change
    create_table :portfolios do |t|
      t.integer :user_id, null: false
      t.string :title, null: false, default: ""
      t.string :link, default: ""
      t.text :description

      t.timestamps
    end
  end
end
