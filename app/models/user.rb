class User < ApplicationRecord
  has_secure_password :password

  before_save :downcase_email

  validates :email, format: {with: URI::MailTo::EMAIL_REGEXP}, presence: true, uniqueness: true
  validates :name, presence: true
  validates :password, presence: true

  def generate_password_reset_token
    signed_id expires_in: 10.minutes, purpose: :password_reset
  end

  def send_password_reset_email
    password_reset_token = generate_password_reset_token
    UserMailer.password_reset(self, password_reset_token).deliver_now
  end

  private
  def downcase_email
    self.email = email.downcase
  end

end
