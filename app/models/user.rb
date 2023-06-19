# app/models/user.rb
class User < ApplicationRecord
    has_many :friendships
    has_many :friends, through: :friendships
  
    validates :username, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true
    validates :password, presence: true
  end
  
  # app/models/friendship.rb
  class Friendship < ApplicationRecord
    belongs_to :user
    belongs_to :friend, class_name: 'User'
  
    validates :user_id, uniqueness: { scope: :friend_id }
  end
  
  # app/controllers/api/users_controller.rb
  class Api::UsersController < ApplicationController
    def create
      user = User.new(user_params)
      if user.save
        render json: user
      else
        render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    private
  
    def user_params
      params.require(:user).permit(:username, :email, :password)
    end
  end
  
  # config/routes.rb
  Rails.application.routes.draw do
    namespace :api do
      resources :users, only: [:create]
    end
  end
  