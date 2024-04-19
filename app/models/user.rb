class User < ApplicationRecord
  has_secure_password :password

  before_save :downcase_email

  validates :email, format: {with: URI::MailTo::EMAIL_REGEXP}, presence: true, uniqueness: true
  validates :name, presence: true

  private
  def downcase_email
    self.email = email.downcase
  end

end
