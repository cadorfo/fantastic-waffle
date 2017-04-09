Rails.application.routes.draw do
  get 'message/create'

  get '/', to: 'home#index'
  post '/messages', to: "message#create"
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
