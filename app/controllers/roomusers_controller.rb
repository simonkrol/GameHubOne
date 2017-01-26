class RoomusersController < ApplicationController

	def create

		current_user.roomusers.create(user_id: current_user.id, room_id: params[:commit])
	end

	def destroy
	    redirect_to rooms_path
  	end

  	def delete

  	end
end
