class RemoveColumnsUsers < ActiveRecord::Migration[5.0]
 	def change
  		remove_column :users, :rooms_in
  		remove_column :users, :rooms_owned
  	end
end
