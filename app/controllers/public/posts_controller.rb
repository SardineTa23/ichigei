class Public::PostsController < ApplicationController
  def index
    @q = Post.ransack(params[:q])
    @posts = @q.result(distinct: true).page(params[:page]).per(20).order(created_at: :desc)
  end

  def show 
    @post = Post.find(params[:id])
  end
   
  def create
    @post = current_user.posts.new(post_params)
    @post.category_id = params[:post][:category].to_i
    if @post.save
      redirect_to user_path(current_user)
    else
      @user = current_user
      render 'public/users/show'
    end
  end

  def edit
  end

  def update
  end

  def destroy
    post = Post.find(params[:id])
    if current_user == post.user
      post.destroy
      redirect_to user_path(current_user)
    else
      redirecto_to root_path
    end
  end

  private
    def post_params
      params.require(:post).permit(:title, :content, :url, images_images: [])
    end
end
