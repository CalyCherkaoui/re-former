class User < ApplicationRecord
  validates :username, presence: true
  validate :email, presence: true
  vaidate: password, presence: true
end
