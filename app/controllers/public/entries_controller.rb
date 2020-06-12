class Public::EntriesController < ApplicationController
  before_action :authenticate_user!
  def index
    @entries = current_user.entries
  end
  
  def show
    @entry = Entry.find(params[:id])
  end

  def create
    work = Work.find(params[:work_id])
    if  current_user.check_entry(work) == nil
      room = Room.create
      @entry = current_user.entries.create(work_id: work.id, room_id: room.id)
      redirect_to work_path(work)
    end
  end
end
