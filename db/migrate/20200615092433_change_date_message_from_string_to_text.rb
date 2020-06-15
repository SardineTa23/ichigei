class ChangeDateMessageFromStringToText < ActiveRecord::Migration[5.2]
  def up
    change_column :messages, :message, :text, default: nil
  end

  def down
    change_column :messages, :message, :string, null: false, dafault: ''
  end
end
