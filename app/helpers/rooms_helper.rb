module RoomsHelper

	def remove_participants(id)
		@room=Room.find_by_id(id)

		@room.participants.each do |user|
			user.update_attribute(:rooms_in, user.rooms_in-[id])
		end
	end

	#def add_participant(room, user)
	#	room.update_attribute(:participants, room.participants.push(user.id))
	#	user.update_attribute(:rooms_in, user.rooms_in.push(room.id))
	#end
end
