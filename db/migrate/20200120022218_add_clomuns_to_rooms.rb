class AddClomunsToRooms < ActiveRecord::Migration[5.2]
  def change
    add_column :rooms, :public, :boolean, default: false
  end
end
