class User < ApplicationRecord
  has_secure_password
  validates :username, uniqueness: true

  has_many :tasks
  has_many :routines, through: :tasks
end
