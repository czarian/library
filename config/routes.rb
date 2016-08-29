Rails.application.routes.draw do
  resources 'rentals'

  devise_for :users
  root 'books#index'
  resources :books do
    member do
      post :borrow
      post :return
    end
  end
end
