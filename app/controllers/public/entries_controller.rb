class Public::EntriesController < ApplicationController
  def index
    @entries = current_user.entries
  end
  
  def show
    @entry = Entry.find(params[:id])
  end

  def create
    work = Work.find(params[:work_id])
    if  current_user.check_entry(work) == nil
      @entry = current_user.entries.create(work_id: work.id)
      redirect_to work_path(work)
    end
  end
end
