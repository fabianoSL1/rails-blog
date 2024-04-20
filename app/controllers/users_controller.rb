class UsersController < ApplicationController

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to sign_in_path
      return
    end

    render :new, status: :unprocessable_entity
  end

  def new
    @user = User.new
  end

  def edit
    @user = Current.user
  end

  def update
    @user = User.find(Current.user.id)

    if @user.update(user_params_update)
      redirect_to root_path
      return
    end

    render :edit, status: :unprocessable_entity
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def user_params_update
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
