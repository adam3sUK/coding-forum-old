class User < ApplicationRecord
  has_secure_password

  has_many :topics
  has_many :posts
end
