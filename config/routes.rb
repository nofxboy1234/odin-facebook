Rails.application.routes.draw do
  get 'home/index'
  devise_for :users,
             controllers: {
               omniauth_callbacks: 'users/omniauth_callbacks',
               registrations: 'users/registrations'
             }
  # devise_scope :user do
  #   delete 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  # end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check

  # Defines the root path route ("/")
  root 'posts#index'

  resources :users, only: %i[index show]
  resources :posts, only: %i[new create index]
  resources :friend_requests, only: %i[index create destroy]
  resources :notifications, only: %i[index]
  resources :comments, only: %i[new create]
  resources :likes, only: %i[create]
  resources :profiles
  resources :friends
end
