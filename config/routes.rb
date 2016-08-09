Rails.application.routes.draw do
  root "regions#show"

  get 'hello_world', to: 'hello_world#index'
  get 'feed', to: 'users#show'
  get 'subscribe', to: 'pages#landing'
  get 'user/:id', to: 'users#info'
  resources :subscribers, only: [:create]
  resources :likes, only: [:create, :destroy]
  resources :dislikes, only: [:create, :destroy]
  resources :regions, param: :slug do
    resources :events, param: :slug
    resources :posts, param: :slug
  end


  devise_for :users, controllers: { :omniauth_callbacks => "users/facebook_callbacks", registrations: "registrations" }

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/devel/emails"
  end
end
