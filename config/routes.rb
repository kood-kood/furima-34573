Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'items/index'
  root to: 'items#index'


  # resources :items, only: :index
  # root 'items#index'
  resources :items, only: :index

  resources :items, only: [:index, :new, :edit, :show] do
    resources :orders, only: :index
  end

  # resources :users, only: :show

end
