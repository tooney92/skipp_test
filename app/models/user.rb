class User < ApplicationRecord
  has_secure_password
  has_many :glasses
  validates_presence_of :email
  validates_format_of :email, with: URI::MailTo::EMAIL_REGEXP
end
