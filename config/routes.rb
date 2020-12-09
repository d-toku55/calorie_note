Rails.application.routes.draw do
  get 'user_recodrs/index'
  devise_for :users

  root to: "user_recodrs#index"

  resources :user_recodrs, only: :index do
    collection do
      get 'search'
    end
    resources :users, only: [:show, :create]
  end
  
end
