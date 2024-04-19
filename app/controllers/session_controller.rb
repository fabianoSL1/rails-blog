class SessionController < ApplicationController
  before_action :redirect_if_authenticated

  def create
    @user = User.find_by(email: params[:user][:email].downcase)

    if @user.nil?
      render :new, status: :unprocessable_entity
      return
    end

    if @user.authenticate(params[:user][:password])
      login @user
      redirect_to root_path
      return
    end

    render :new, status: :unprocessable_entity
  end

  def new
  end
end
