
  
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
  