class CommentsController < ApplicationController
  def create
    @comment = Comment.new

    if Current.user.present?
      @comment.user_id = Current.user.id
    end

    @comment.content = params[:content]
    @comment.post_id = params[:post_id]

    if @comment.save
      redirect_to @comment.post
      return
    end

    redirect_to @comment.post, status: :unprocessable_entity
  end

  def destroy
    @comment = Comment.find(params[:id])

    unless is_owner? or is_post_owner?
      redirect_to @comment.post, status: :unauthorized
      return
    end

    if @comment.destroy
      redirect_to @comment.post
      return
    end

    redirect_to @comment.post, status: :unprocessable_entity
  end

  private
  def is_owner?
    @comment.user_id == current_user.id
  end

  private
  def is_post_owner?
    @comment.post.user_id == current_user.id
  end
end
