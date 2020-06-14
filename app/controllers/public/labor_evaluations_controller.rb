class Public::LaborEvaluationsController < ApplicationController
  before_action :authenticate_user!

  def create
    entry = Entry.find(params[:entry_id])
    if current_user == entry.work.user
      a = LaborEvaluation.new(user_id: entry.user.id, entry_id: entry.id, evaluation: params[:num].to_i)
      a.save
      redirect_to room_path(entry.room)
    end
  end
end
