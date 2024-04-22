class PostsController < ApplicationController

  def index
    @posts = Post.order(created_at: :desc).page params[:page]
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    @post.user_id = current_user.id

    if @post.save
      redirect_to @post
      return
    end

    render new_post_path, status: :unprocessable_entity
  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:id])

    unless is_owner?
      render @post, status: :unauthorized
      return
    end

    @post.destroy
    redirect_to posts_path
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    unless is_owner?
      redirect_to status: :unauthorized
    end

    if @post.update(post_params)
      redirect_to @post
    end
  end

  private
  def post_params
    params.require(:post).permit(:title, :content)
  end

  private
  def is_owner?
    @post.user_id == current_user.id
  end
end
