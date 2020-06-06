class Public::EntriesController < ApplicationController
  def show
    @entry = Entry.find(params[:id])
  end

  def create
    @entry = current_user.entries.create(work_id: params[:work_id])
  end
end
