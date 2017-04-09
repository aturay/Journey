Rails.application.routes.draw do
  namespace :users do
    get 'omniauth_callbacks/vkontakte'
  end

  devise_for :users, controllers: {
    omniauth_callbacks: "users/omniauth_callbacks",
    registrations:      'users/registrations'
  }

  resources :users#, :only => [:index, :destroy, :new]

  root 'users#index'
end
