class Public::EntriesController < ApplicationController
  def index
  end

  def show
  end

  def create
    @entry = current_user.entries.create(work_id: params[:work_id])
  end
end
