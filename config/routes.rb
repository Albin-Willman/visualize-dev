Rails.application.routes.draw do

  resources :projects do
    resources :features, except: [:index, :show]
  end

  resource :user
  resources :user_sessions, only: [:create]
  get 'login', to: 'user_sessions#new', as: 'login'
  get 'logout', to: 'user_sessions#destroy', as: 'logout'

  root to: 'home#start'
end
