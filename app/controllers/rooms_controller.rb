class RoomsController < ApplicationController

  before_action :logged_in_user, only: [:show, :index, :edit, :update]
  before_action :correct_user, only: [:edit, :update]


  def index
    @rooms=Room.all
  end

  def show 
    @room = Room.find_by_id(params[:id])
  end
  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    @user = current_user.id
    @room.owner=@user
    if(!admin? and current_user.rooms_owned.length>=3)
      flash[:danger] = "Only 3 rooms may be owned at once, please delete a room and try again!"
      redirect_to rooms_path
    elsif(@room.save)
      flash[:success] = "Successfully created room!"
      @owned=current_user.rooms_owned.push(@room.id)
      current_user.update_attribute(:rooms_owned, @owned)
      #render plain:current_user.inspect
      redirect_to @room
    else
      render 'new'
    end
  end

  def destroy
    @room = Room.find_by_id(params[:id])
    @owner=User.find_by_id(@room.owner)
    @owner.update_attribute(:rooms_owned, @owner.rooms_owned-[@room.id])
    @room.destroy
    redirect_to rooms_path
  end

  def edit
    @room = Room.find_by_id(params[:id])
  end

  def update
    @room = Room.find_by_id(params[:id])
    if @room.update_attributes(room_params)
      flash[:success] = "Room updated"
      redirect_to @room
    else
      render 'edit'
    end
  end


  private def room_params
    params.require(:room).permit(:name, :private)
  end

  def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

    def correct_user
      @room= Room.find_by_id(params[:id])
      unless @room.owner==current_user.id or admin?
        flash[:danger] = "Invalid page"
        redirect_to(home_url)
      end
      
    end

end
