Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: "users/omniauth_callbacks",
    registrations:      'users/registrations'
  }

  post 'users/:id', to: 'users#edit_event'
  resources :users

  root 'users#index'
end
