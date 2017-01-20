class UsersController < ApplicationController
	before_action :logged_in_user, only: [:edit, :update]
	before_action :correct_user, only: [:edit, :update]
	def index
		@users=User.all
	end

	def show 
		@user = User.find(params[:id])
	end
	def new
		@user = User.new
	end
	def create
		@user = User.new(user_params)
		if(@user.save)
			flash[:success] = "Welcome to Secrets!"
			log_in @user
			redirect_to @user
		else
			render plain: 'create'
		end
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update_attributes(user_params)
			flash[:success] = "Profile updated"
			redirect_to @user
		else
			render 'edit'
		end
	end

	private def user_params
      params.require(:user).permit(:name, :address, :email, :password, :password_confirmation)
    end

    def logged_in_user
    	unless logged_in?
    		flash[:danger] = "Please log in."
    		redirect_to login_url
    	end
    end

    def correct_user
    	@user = User.find(params[:id])
    	flash[:danger] = "Invalid page"
    	redirect_to(home_url) unless current_user?(@user)
    end
end
