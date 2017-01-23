class ParticipantsChangeColumnType < ActiveRecord::Migration[5.0]
  def change
  	remove_column :rooms, :participants
  end
end
