class Public::EntriesController < ApplicationController
  before_action :authenticate_user!
  def index
    @entries = current_user.entries
  end
  
  def show
    @entry = Entry.find(params[:id])
  end

  def scout
    user = User.find(params[:user_id])
    work = Work.find(params[:works][:id])
    if user.check_entry(work) == nil
      entry = work.entries.new(user_id: user.id, points_when_applying: work.reward)
      if entry.save
        room = Room.create(entry_id: entry.id)
        redirect_to room_path(room)
      else
        @post = Post.find(params[:post_id])
        render 'public/posts/show'
      end
    else
      entry = user.entries.find_by(work_id: work.id)
      redirect_to room_path(entry.room)
    end
  end

  def create
    work = Work.find(params[:work_id])
    if  current_user.check_entry(work) == nil
      @entry = current_user.entries.create(work_id: work.id, points_when_applying: work.reward)
      Room.create(entry_id: @entry.id)
      redirect_to work_path(work)
    end
  end

  def update
    entry = Entry.find(params[:id])
    if current_user == entry.work.user
      entry.working_status = params[:entry][:working_status]
      if params[:entry][:working_status] == 'confirmed'  ##ステータスを確定に更新するとき
        if entry.points_when_applying > current_user.point
          @room = entry.room
          @work = entry.work
          render 'public/rooms/show'
        else
          entry.save
          redirect_to room_path(entry.room)
        end
      elsif params[:entry][:working_status] == 'completed'  ##ステータスを処理済みに更新するとき
        entry.save
        entry.user.update(point: entry.user.point + entry.points_when_applying)
        entry.work.user.update(point: entry.work.user.point - entry.points_when_applying)
        redirect_to room_path(entry.room)
      end
    end
  end
end
