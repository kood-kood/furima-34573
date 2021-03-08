Rails.application.routes.draw do
  
  devise_for :users
  root to: 'items#index'
  resources :items, only: [:index, :new, :create, :show, :edit]
  #  do
  #   resources :orders, only: :index
  # end

  # resources :users, only: :show

end
