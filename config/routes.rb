Rails.application.routes.draw do
  namespace :users do
    get 'omniauth_callbacks/facebook'
  end

  namespace :users do
    get 'omniauth_callbacks/vkontakte'
  end

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :users, :only => [:index, :destroy]
  root 'users#index'
end
