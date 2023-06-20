# app/models/user.rb
class User < ApplicationRecord
    has_many :friendships
    has_many :friends, through: :friendships
  
    validates :username, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true
    validates :password, presence: true
end
