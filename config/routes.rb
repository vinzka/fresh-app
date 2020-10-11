Rails.application.routes.draw do
  devise_for :users
  root to: 'activities#index'

  get 'dashboard', to: 'pages#dashboard', as: :dashboard

  resources :activities do
    resources :players, only: :create
    resources :chatrooms, only: [:show] do
      resources :messages, only: :create
    end
  end

  resources :chatrooms, only: [:index]

  get 'users/me', to: 'users#me', as: :me

  resources :users, only: %i[show edit update]

  resources :players, only: :destroy
end
