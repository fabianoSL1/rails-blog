class PostsFileController < ApplicationController

  def create
    @post_file = PostsFile.new(file: params[:file])

    if @post_file.save
      ProcessFileJob.perform_async @post_file.id, Current.user.id
      redirect_to root_path
      return
    end

    redirect_to root_path, status: :unprocessable_entity
  end

  def index
  end
end
