Rails.application.routes.draw do
  namespace :users do
    get 'omniauth_callbacks/vkontakte'
  end

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  # devise_scope :user do
  #   get '/sign-in' => "devise/sessions#new", :as => :login
  # end

  resources :users#, :only => [:index, :destroy, :new]

  root 'users#index'
end
