Rails.application.routes.draw do
  namespace :users do
    get 'omniauth_callbacks/vkontakte'
  end

  devise_scope :user do
    get "/users/omniauth_callbacks/vkontakte" => "some_devise_controller"
  end

  devise_for :users, controllers: {
    omniauth_callbacks: "users/omniauth_callbacks",
    registrations:      'users/registrations'
  }

  resources :users#, only: [:index, :destroy]
  post 'users/:id', to: 'users#edit_event'

  root 'users#index'
end
