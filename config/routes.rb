Rails.application.routes.draw do

  root to: 'products#index'
  devise_for :users
  resources :products do
    collection { post :search, to: 'products#index' }
  end
end
