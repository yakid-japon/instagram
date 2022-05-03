class FavoritesController < ApplicationController
  def index
    @favorites = current_user.favorites
  end

  def show
    @favorite = current_user.favorites.find_by(post_id: params[:id])
  end

  def create
      current_user.favorites.create(post_id: params[:post_id])
      flash[:info] = "Ce post a été ajouté à vos favoris"
      redirect_to posts_path
  end

  def destroy
    current_user.favorites.find_by(id: params[:id]).destroy
    flash[:danger] = "Ce post a été retiré de vos favoris"
    redirect_to posts_path
  end
end
