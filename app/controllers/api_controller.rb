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