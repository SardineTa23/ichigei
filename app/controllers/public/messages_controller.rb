class Public::MessagesController < ApplicationController
  before_action :authenticate_user!
  def create
    room = Room.find(params[:room_id])
    message = current_user.messages.new(message_params)
    message.room_id = room.id
    message.save
    redirect_to room_path(room)
  end

  private
    def message_params
       params.require(:message).permit(:message)
    end
end
