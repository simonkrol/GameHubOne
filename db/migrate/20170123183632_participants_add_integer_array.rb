class ParticipantsAddIntegerArray < ActiveRecord::Migration[5.0]
  def change
  	add_column :rooms, :participants, :integer, array: true, default: []
  end
end
