class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]
  before_action :get_all_post, only: %i[ index create confirm ]
  before_action :save_post, only: %i[ create confirm ]

  def index
    @post = Post.new
  end

  def show
  end

  def edit
  end

  def update
    if params[:Back]
      redirect_to user_path(current_user)
    else
      if @post.update(post_params)
        flash[:info] = "Publication modifiée avec succès !!!"
        redirect_to user_path(current_user)
      else
        render "edit"
      end
    end
  end

  def destroy
    @post.destroy
    flash[:danger] = "Publication supprimée !!!"
    redirect_to user_path(current_user.id)
  end

  def confirm
    render "posts/index" if @post.invalid?
  end

  def create
    
    if params[:Back]
      render "index"
    else
      if @post.save
        PostMailer.with(user: current_user).post_created.deliver_now
        redirect_to posts_path
        flash[:success] = "Publication enrégistrée !!!"
      else
        render :index
      end
    end
  end

  private
  def set_post
    @post = Post.find(params[:id])
  end

  def get_all_post
    @posts = Post.all.order(created_at: :desc)
  end

  def post_params
    params.require(:post).permit(:photo, :photo_cache, :content)
  end

  def save_post
    @post = current_user.posts.build(post_params)
  end
end
