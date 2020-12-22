class User < ApplicationRecord
  validates :name, presence: true
  before_validation { email.downcase! }
  validates :email, presence: true,
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]*\.[a-z]+\z/i }
  validates :password, presence: true
  has_many :blogs
end