class Public::BookMarksController < ApplicationController
  def create
    @user = current_user
    @works = Work.find(params[:work_id])
    @fav = @user.book_marks.create(work_id: @works.id)
    # redirect_back(fallback_location: root_path)
  end

  def destroy
    @works = Work.find(params[:work_id])
    @fav = current_user.book_marks.find_by(work_id: @works.id)
    @fav.destroy
    # redirect_back(fallback_location: root_path)
  end
end
