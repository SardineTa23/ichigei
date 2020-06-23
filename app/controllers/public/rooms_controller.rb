class Public::RoomsController < ApplicationController
  before_action :authenticate_user!
  def show
    @room = Room.find(params[:id])
    @entry = @room.entry
    @work = Work.with_deleted.find(@entry.work_id)
  end

  def index
    @post = current_user.posts.new
    @rooms = []
    Work.with_deleted.where(user_id: current_user.id).each do |work|
      work.entries.each do |entry|
        @rooms << entry.room
      end
    end
    current_user.entries.each do |entry|
      @rooms << entry.room
    end
  end
end
