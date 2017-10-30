class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  has_secure_password

  validates :first_name, :last_name, presence: true
  validates :email, presence: true, uniqueness: true, format: VALID_EMAIL_REGEX
end
