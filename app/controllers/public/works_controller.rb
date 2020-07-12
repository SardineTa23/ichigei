class Public::WorksController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: [:edit, :update]
  
  def index
    @q = Work.where(recruitment_status: 0).ransack(params[:q])
    @works = @q.result(distinct: true).page(params[:page]).per(15).order(created_at: :desc)
    @post = current_user.posts.new
  end

  def my_works
    @post = current_user.posts.new
    @works = current_user.works
  end

  def my_work_entries
    @post = current_user.posts.new
    @work = Work.find(params[:id])
    @entries = @work.entries
    @rooms = []
    if @work.entries != []
      @entries.each do |entry| 
        @rooms << entry.room
      end 
    else
      redirect_to work_path(@work)
    end
  end

  def show
    @post = current_user.posts.new
    @work = Work.find(params[:id])
    @entry = Entry.find_by(work_id: @work.id, user_id: current_user.id)
  end

  def new
    @work = Work.new
  end

  def edit
    @work = Work.find(params[:id])
  end

  def create
    @work = current_user.works.new(work_params)
    if @work.save
      redirect_to work_path(@work)
    else
      render :new
    end
  end

  def update
    @work = Work.find(params[:id])
    if @work.update(work_params)
      redirect_to work_path(@work)
    else
      render :edit
    end
  end

  def destroy
    @work = Work.find(params[:id])
    @work.destroy
    redirect_to works_path
  end

  private
    def work_params
      params.require(:work).permit(:title, :description, :condition,:started_at, :ended_at, :reward, :recruitment_status, :image,
                                   :postal_code, :prefecture_code, :prefecture_name, :address_city, :address_street, :address_building, :category_id)                          
    end

    def correct_user
      work = Work.find(params[:id])
      if current_user != work.user
        redirect_to user_path(current_user)
      end
    end
end
