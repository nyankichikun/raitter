class AddIndexToEntries < ActiveRecord::Migration[5.2]
  def change
    add_index :entries, [:room_id, :user_id], unique: true
  end
end
