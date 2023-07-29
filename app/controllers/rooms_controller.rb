class RoomsController < ApplicationController

  before_action :authenticate_user!

  def index
    @room = Room.new
    @current_user = current_user
    @rooms = Room.public_rooms
    # @single_room = Room.find(params[:id])
    @users = User.all_except(@current_user)
  end

  def show
    @current_user = current_user
    @single_room = Room.find(params[:id])
    
    @room = Room.new
    @rooms = Room.public_rooms
    
    @message = Message.new
    @messages = @single_room.messages.order(created_at: :desc)
     
    @users = User.all_except(@current_user)
    render "index"
  end

  # def new
  #   @room = Room.new
  # end
  
  
  def create
    @room = Room.create(name: params["room"]["name"])
  end
end
