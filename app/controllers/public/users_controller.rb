class Public::UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @post = current_user.posts.new
    labar_sum = 0
    employer_sum = 0
    @labor_evaluations = @user.labor_evaluations
    @employer_evaluations = @user.employer_evaluations
    @labor_evaluations.each do |n|
      labar_sum += n.evaluation
    end
    @employer_evaluations.each do |n|
      employer_sum += n.evaluation
    end

    if @labor_evaluations != [] && @employer_evaluations != []
      @employer_evaluation_ave  = employer_sum / @employer_evaluations.count
      @labor_evaluation_ave = labar_sum / @labor_evaluations.count
      @total_evaluation_ave = (labar_sum + employer_sum) / (employer_evaluations.count + @labor_evaluations.count)
    elsif @labor_evaluations != [] && @employer_evaluations == []
      @employer_evaluation_ave  = 0
      @labor_evaluation_ave = labar_sum / @labor_evaluations.count
      @total_evaluation_ave = @labor_evaluation_ave
    elsif @labor_evaluations == [] && @employer_evaluations != []
      @employer_evaluation_ave  = employer_sum / @employer_evaluations.count
      @labor_evaluation_ave = 0
      @total_evaluation_ave = @employer_evaluation_ave
    else
      @employer_evaluation_ave  = 0
      @labor_evaluation_ave = 0
      @total_evaluation_ave = 0
    end
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if  current_user == @user 
      @user.update(user_params)
      redirect_to user_path(@user)
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    if current_user == @user
      @user.destroy
      redirect_to users_withdraw_path
    else
      redirect_to user_path(@user)
    end
  end

  def confirm
    @user = User.find(params[:user_id])
  end

  def withdraw
  end

  private
    def user_params
       params.require(:user).permit(:name, :introduction, :profile_image, :display_name, :email, :url_link, 
                                    :portfolio, :birth_date, :phone_number, :status)
    end
end
