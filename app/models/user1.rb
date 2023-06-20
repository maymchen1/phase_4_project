
  
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
  