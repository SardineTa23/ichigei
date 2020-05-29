class Public::PostsController < ApplicationController
  def index
  end

  def show 
    @post = Post.find(params[:id])
  end
   
  def create
    @post = current_user.posts.new(post_params)
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
  end

  private

    def post_params
      params.require(:post).permit(:title, :content, :url, post_images_images: [])
    end
end
