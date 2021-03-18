Rails.application.routes.draw do
  
  devise_for :users

  root to: 'items#index'

  resources :items do
    collection do
      get 'search'
    end
    resources :orders, only: [:index, :create]
    root 'messages#new'
    resources :messages, only: [:create]
  end

  # resources :users, only: :show

  # mount ActionCable.server => '/cable'

end
