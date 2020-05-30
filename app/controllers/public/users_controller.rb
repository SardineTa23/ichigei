class Public::UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @post = current_user.posts.new
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
