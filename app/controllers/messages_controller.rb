class MessagesController < ApplicationController
  
  
  def index
    
  end
  
  def new
    @message = Message.new
  end

  def create
    @current_user = current_user
    @message = @current_user.messages.create(content: msg_params[:content], room_id: params[:room_id])
  end

  private

  def msg_params
    params.require(:message).permit(:content)
  end

end
