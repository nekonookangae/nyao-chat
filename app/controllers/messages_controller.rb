class MessagesController < ApplicationController
  def index
    @messages = Message.all
    @chat_rooms = ChatRoom.all
  end

  def show
    @message = Message.find(params[:id])
    @chat_rooms = ChatRoom.all
  end

  def destroy
    @message = Message.find(params[:id])
    @message.destroy
    redirect_to chat_room_path(@message.chat_room_id)
  end


end
