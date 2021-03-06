require 'sidekiq/web'
Rails.application.routes.draw do
  get 'message/create'

  get '/', to: 'home#index'
  post '/messages', to: "message#create"
  mount Sidekiq::Web => '/sidekiq' if Rails.env == "development"
  devise_for :users, :controllers => {
    :omniauth_callbacks => "users/omniauth_callbacks",
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
