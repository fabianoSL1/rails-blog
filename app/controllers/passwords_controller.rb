class PasswordsController < ApplicationController
  before_action :redirect_if_authenticated

  def new
  end

  def create
    @user = User.find_by(email: params[:user][:email].downcase)

    if @user.present?
      @user.send_password_reset_email
      redirect_to root_path
    end

  end

  def edit
    @user = User.find_signed(params[:password_reset_token], purpose: :password_reset)
  end

  def update
    @user = User.find_signed(params[:password_reset_token], purpose: :password_reset)

    if @user.update(password_params)
      login @user
      redirect_to root_path
    end
  end

  private
  def password_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end
