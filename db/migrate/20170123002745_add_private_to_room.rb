class AddPrivateToRoom < ActiveRecord::Migration[5.0]
  def change
    add_column :rooms, :private, :boolean
  end
end
