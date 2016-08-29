Rails.application.routes.draw do
  resources 'rentals'

  #match "/auth/:provider/callback", to: "omniauth_callbacks#google_oauth2", via: 'get'

  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }
  root 'books#index'
  resources :books do
    member do
      post :borrow
      post :return
    end
  end
end
