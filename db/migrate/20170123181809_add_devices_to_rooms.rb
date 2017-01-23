class AddDevicesToRooms < ActiveRecord::Migration[5.0]
  def change
    add_column :rooms, :console, :boolean
    add_column :rooms, :desktop, :boolean
    add_column :rooms, :mobile, :boolean
  end
end
