class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  before_save{email.downcase!}
  validates :name, presence: true, length: {maximum: Settings.user.name}
  validates :email, presence: true, length: {maximum: Settings.user.email},
            format: {with: VALID_EMAIL_REGEX},
            uniqueness: true
  validates :password, presence: true,
            length: {minimum: Settings.user.password_lenght}

  has_secure_password
end
