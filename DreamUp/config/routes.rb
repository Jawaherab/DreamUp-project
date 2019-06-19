Rails.application.routes.draw do

  # get 'comments/index'
  # get 'comments/new'
  # get 'comments/show'
  # get 'comments/edit'
  resources :comments
  root 'home#index'
  
  devise_for :users
  
  resources :dreams do
    resources :users
    resources :comments
  end



end
