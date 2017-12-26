class User < ApplicationRecord
  validates :login, uniqueness: true
  validates :password_hash, null: false
end
