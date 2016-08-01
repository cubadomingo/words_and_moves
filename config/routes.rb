Rails.application.routes.draw do
  root "pages#landing"

  get 'hello_world', to: 'hello_world#index'
  get 'feed', to: 'users#feed'
  get 'explore', to: 'regions#explore'
  get 'region/feed', to: 'regions#feed'
  get 'region/feed/event', to: 'regions#event'
  get 'region/feed/post', to: 'regions#post'

  resources :subscribers, only: [:create]
  resources :likes, only: [:create]
  resources :dislikes, only: [:create]

  devise_for :users, :controllers => { :omniauth_callbacks => "users/facebook_callbacks" }

end
