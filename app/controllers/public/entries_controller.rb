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
    @work = Work.find(params[:work_id])
    if  current_user.check_entry(@work) == nil
      @entry = current_user.entries.create(work_id: @work.id, points_when_applying: @work.reward)
      Room.create(entry_id: @entry.id)
    else
      redirect_to root_path, flash: {
        obj: @work,
        error_messages: 'エラーが発生しました'
      }
    end
  end

  def update
    @entry = Entry.find(params[:id])
    @work = Work.with_deleted.find(@entry.work_id)
    if current_user == @work.user
      if @entry.working_status_i18n == '未確定'  ##ステータスを確定に更新するとき
        if @entry.points_when_applying > current_user.point
          @room = @entry.room
          flash.now[:error_messages] = 'ポイントが足りません'
          render 'public/rooms/show'
        else
          @entry.working_status = 'confirmed'
          @entry.save
          redirect_to room_path(@entry.room)
        end
      elsif @entry.working_status_i18n == '確定済み'  ##ステータスを処理済みに更新するとき
        @entry.working_status = 'completed'
        @entry.save
        @entry.user.update(point: @entry.user.point + @entry.points_when_applying)
        @work.user.update(point: @work.user.point - @entry.points_when_applying)
        redirect_to room_path(@entry.room)
      end
    end
  end
end
