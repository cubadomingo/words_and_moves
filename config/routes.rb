Rails.application.routes.draw do
  root "pages#landing"

  get 'hello_world', to: 'hello_world#index'
  get 'feed', to: 'users#feed'
  get 'region/new', to: 'regions#new'
  get 'explore', to: 'regions#explore'
  get '/:slug/feed', to: 'regions#feed', as: 'region_feed'
  get '/:slug/event/:id', to: 'regions#event', as: 'region_event'
  get '/:slug/post/:id', to: 'regions#post', as: 'region_post'

  resources :subscribers, only: [:create]
  resources :likes, only: [:create]
  resources :dislikes, only: [:create]
  resources :regions, path: '', only: [:create, :update, :destroy]

  devise_for :users, :controllers => { :omniauth_callbacks => "users/facebook_callbacks" }

end
