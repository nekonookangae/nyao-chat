class MessagesController < ApplicationController
  def index
    @messages = Message.all
    @chat_rooms = ChatRoom.all
  end

end
