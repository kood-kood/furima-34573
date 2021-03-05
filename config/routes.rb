Rails.application.routes.draw do
  
  devise_for :users
  root to: 'items#index'

    resources :orders, only: :index
  resources :items, only: [:index, :new, :edit, :show]
  #  do
  #   resources :orders, only: :index
  # end

  # resources :users, only: :show

end
