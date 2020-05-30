class Public::FavoritesController < ApplicationController
  def create
    @user = current_user
    @post = Post.find(params[:post_id])
    @fav = @user.favorites.create(post_id: @post.id)
    # redirect_back(fallback_location: root_path)
  end

  def destroy
    @post = Post.find(params[:post_id])
    @fav = current_user.favorites.find_by(post_id: @post.id)
    @fav.destroy
    # redirect_back(fallback_location: root_path)
  end
end
