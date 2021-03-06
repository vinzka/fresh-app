class ChatroomsController < ApplicationController
  def show
    @activity = Activity.find(params[:activity_id])
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
  end

  def index
    @chatrooms = current_user.my_activity_chatrooms
  end
end
