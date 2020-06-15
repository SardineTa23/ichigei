class CreateEmployerEvaluations < ActiveRecord::Migration[5.2]
  def change
    create_table :employer_evaluations do |t|
      t.integer :user_id, null: false
      t.integer :entry_id, null: false
      t.integer :evaluation, null: false, default: 0
      t.timestamps
    end
  end
end
