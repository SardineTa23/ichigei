class Public::MessagesController < ApplicationController
  before_action :authenticate_user!
  def create
    @room = Room.find(params[:room_id])
    @message = current_user.messages.new(message_params)
    @message.room_id = @room.id
    unless @message.save
      @entry = @room.entry
      @work = Work.with_deleted.find(@entry.work_id)
      render 'public/rooms/show'
    end
  end

  private
    def message_params
       params.require(:message).permit(:message)
    end
end
