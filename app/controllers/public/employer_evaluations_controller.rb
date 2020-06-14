class Public::EmployerEvaluationsController < ApplicationController
  before_action :authenticate_user!

  def create
    entry = Entry.find(params[:entry_id])
    if current_user == entry.user
      a = EmployerEvaluation.new(user_id: entry.work.user.id, entry_id: entry.id, evaluation: params[:num].to_i)
      a.save
      redirect_to room_path(entry.room)
    end
  end
end
