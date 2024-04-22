class TagsController < ApplicationController

  def create
    @tag = Tag.find_or_create_by(name: params[:name].strip)
    @post = Post.find(params[:post_id])

    if @post.tags.include? @tag
      redirect_to edit_post_path(@post)
      return
    end

    @post.tags << @tag

    if @post.save
      redirect_to edit_post_path(@post)
      return
    end

    redirect_to edit_post_path(@post), status: :unprocessable_entity
  end

  def destroy
    @tag = Tag.find(params[:id])
    @post = Post.find(params[:post_id])

    if @post.tags.delete(@tag)

      if @tag.posts.empty?
        @tag.delete
      end

      redirect_to edit_post_path(@post)
    end

  end

end
