Rails.application.routes.draw do
  get 'pages/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "pages#index"

  devise_for :users, :controllers => { :omniauth_callbacks => "users/facebook_callbacks" }

end
