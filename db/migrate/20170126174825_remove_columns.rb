class RemoveColumns < ActiveRecord::Migration[5.0]
  def change
  	remove_column :users, :rooms_in
  	remove_column :users, :rooms_owned
  	remove_column :rooms, :participants


  	create_table :users_rooms, id: false do |t|
    	t.belongs_to :users, index: true
    	t.belongs_to :rooms, index: true
    end
  end
end
