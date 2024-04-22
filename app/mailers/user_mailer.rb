class UserMailer < ApplicationMailer

  def password_reset(user, password_token_reset)
    @user = user
    @password_reset_token = password_token_reset

    mail to: @user.email, subject: "Password Reset"
  end
end
