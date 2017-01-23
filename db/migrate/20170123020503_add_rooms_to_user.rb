class AddRoomsToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :rooms_in, :integer, array: true, default: []
    add_column :users, :rooms_owned, :integer, array: true, default: []
  end
end
