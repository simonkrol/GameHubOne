class UsersController < ApplicationController
	before_action :logged_in_user, only: [:show, :index, :edit, :update]
	before_action :correct_user, only: [:show, :edit, :update]
	before_action :administrator, only: [:index]
	def index
		@users=User.all
	end

	def show 
		@user = User.find_by_id(params[:id])
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
			render 'new'
		end
	end

	def edit
		@user = User.find_by_id(params[:id])
	end

	def update
		@user = User.find_by_id(params[:id])
		if @user.update_attributes(user_params)
			flash[:success] = "Profile updated"
			redirect_to @user
		else
			render 'edit'
		end
	end

	def destroy
		@user = User.find_by_id(params[:id])
		@user.destroy
		redirect_to users_path
	end

	private def user_params
      params.require(:user).permit(:name, :username, :email, :password, :password_confirmation)
    end

    def logged_in_user
    	unless logged_in?
    		store_location
    		flash[:danger] = "Please log in."
    		redirect_to login_url
    	end
    end

    def correct_user
    	@user = User.find_by_id(params[:id])
    	unless current_user?(@user) or admin?
    		flash[:danger] = "Invalid page"
    		redirect_to(home_url)
    	end
    	
    end

    def administrator
    	unless admin?
    		flash[:danger] = "Invalid page"
    		redirect_to(home_url)
    	end
    end
end
