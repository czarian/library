Rails.application.routes.draw do
  devise_for :users
  resources :books do
    member do
      post :borrow
      post :return
    end
  end
end
