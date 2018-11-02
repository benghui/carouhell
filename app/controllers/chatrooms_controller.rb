class ChatroomsController < ApplicationController

  def index
    @chatrooms = Chatroom.all
  end

  def new
    @chatroom = Chatroom.new
  end
  
  def create
    @chatroom = current_user.chatrooms.build(chatrooms_params)
    
    if @chatroom.save
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

  def create_message
    # puts "RECEIVEDDD: #{params[:message][:body]}"
    @message = current_user.messages.build(message_params)
    # read incoming params 
    # create message 
    # call broadcast to actioncable
    ActionCable.server.broadcast("chatrooms_#{message.chatroom.id}_channel", message: render_message(message), user: message.user.username)
  end

  private

  def chatrooms_params
    params.require(:chatroom).permit(:title)
  end

  def message_params
    params.require(:message).permit(:body, :user_id, :chatroom_id)
  end

end