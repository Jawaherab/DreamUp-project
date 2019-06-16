Rails.application.routes.draw do

  root 'home#index'
  
  devise_for :users
  
  resources :dreams do
    resources :users
  end

end
