Rails.application.routes.draw do
  root "pages#landing"

  get 'hello_world', to: 'hello_world#index'
  get 'feed', to: 'users#feed'
  get 'region/new', to: 'regions#new'
  get 'explore', to: 'regions#explore'

  as :user do
    get '/signin', to: 'devise/sessions#new', as: :new_user_session
    post 'signin', to: 'devise/sessions#create', as: :user_session
    delete 'signout', to: 'sessions#destroy', as: :destroy_user_session
  end

  get '/:slug/', to: 'regions#feed', as: 'region_feed'
  get '/:slug/event/:slug2', to: 'regions#event', as: 'region_event'
  get '/:slug/post/:slug2', to: 'regions#post', as: 'region_post'

  resources :subscribers, only: [:create]
  resources :likes, only: [:create, :destroy]
  resources :dislikes, only: [:create, :destroy]
  resources :regions, only: [:create, :update, :destroy]


  devise_for :users, controllers: { :omniauth_callbacks => "users/facebook_callbacks", registrations: "registrations" }, skip: [:sessions]

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/devel/emails"
  end
end
