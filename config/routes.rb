Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "pages#landing"

  resources :subscribers, only: [:create]

  devise_for :users, :controllers => { :omniauth_callbacks => "users/facebook_callbacks" }

end
