class CreateRooms < ActiveRecord::Migration[5.0]
  def change
    create_table :rooms do |t|
      t.integer :owner
      t.text :participants, array: true, default: []

      t.timestamps
    end
  end
end
