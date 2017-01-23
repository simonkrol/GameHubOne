class ChangeColumnName < ActiveRecord::Migration[5.0]
  def change
  	remove_column :users, :salt
  	rename_column :users, :address, :username
  end
end
