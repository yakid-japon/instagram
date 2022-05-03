class UsersController < ApplicationController
  skip_before_action :login_required, only: [:new, :create]

  def new
    @user = User.new
    redirect_to user_path(current_user) if current_user
  end

  def edit
    @user = User.find(params[:id])
  end

  def confirm
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:info] = "Profil modifié avec succès !!!"
      redirect_to user_path(current_user)
    else
      render "edit"
    end
  end

  def show
    @user = User.find(params[:id])
    @favorites = current_user.favorites
  end

  def create
    @user = User.new(user_params)
    if @user.save
        redirect_to new_session_path
        flash[:success] = "Compte créé avec succès. Veuillez vous connecter"
    else
        render :new
    end
  end

  private
  def user_params
      params.require(:user).permit(:name, :username, :email, :password,:photo, :photo_cache)
  end

  def user_params_without_pwd
    params.require(:user).permit(:name, :username, :email,:photo, :photo_cache)
  end
end
