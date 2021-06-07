Rails.application.routes.draw do
  devise_for :users
  root to: 'locations#home'
  resources :locations, except: :index do
    resources :albums, only: [:new, :create]
    resources :comments, only: [:new, :create]
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
