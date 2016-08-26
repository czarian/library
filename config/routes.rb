Rails.application.routes.draw do
  devise_for :users
  root 'books#index'
  resources :books do
    member do
      post :borrow
      post :return
    end
  end
end
