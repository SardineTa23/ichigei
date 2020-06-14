class Public::RoomsController < ApplicationController
  def show
    @room = Room.find(params[:id])
    @entry = @room.entry
    @work = Work.with_deleted.find(@entry.work_id)
  end

  def index
  end
end
