class User < ApplicationRecord
  validates :name,  presence: true, length: { maximum: 50 }
  validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }, presence: true, length: { maximum: 255 }, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }
  has_secure_password
end
