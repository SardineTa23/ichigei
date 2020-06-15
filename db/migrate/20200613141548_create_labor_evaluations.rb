class CreateLaborEvaluations < ActiveRecord::Migration[5.2]
  def change
    create_table :labor_evaluations do |t|
      t.integer :user_id, null: false
      t.integer :entry_id, null: false
      t.integer :evaluation, null: false, default: 0
      t.timestamps
    end
  end
end
