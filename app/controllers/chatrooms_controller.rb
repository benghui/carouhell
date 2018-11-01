class ChatroomsController < ApplicationController

  def index
    @chatrooms = Chatroom.all
  end

  def new
    @chatroom = Chatroom.new
  end
  
  def create
    @chatroom = current_user.chatrooms.build(chatrooms_params)
    
    if @chatroom.after_save
      flash[:success] = 'Chatroom added!'
      redirect_to chatrooms_path
    else
      render 'new'
    end
  end

  def show
    @chatroom = Chatroom.includes(:messages).find_by(id: params[:id])
    @message = Message.new
  end

  private

  def chatrooms_params
    params.require(:chatroom).permit(:title)
  end
end