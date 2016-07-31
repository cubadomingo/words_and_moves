Rails.application.routes.draw do
  get 'hello_world', to: 'hello_world#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "pages#landing"

  resources :subscribers, only: [:create]

  get 'feed', to: 'users#feed'

  resources :likes, only: [:create]
  resources :dislikes, only: [:create]

  devise_for :users, :controllers => { :omniauth_callbacks => "users/facebook_callbacks" }

end
