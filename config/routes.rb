Rails.application.routes.draw do
  
  get 'classifications/index'
  get 'classifications/search'
  devise_for :users

  root to: 'items#index'

  resources :items do
    collection do
      get 'search'
    end
    resources :orders, only: [:index, :create]
    root 'messages#new'
    resources :messages, only: [:create]
    
    resources :classifications, only: [:index]
      collection do
        get 'classifications/search'
      end

      resources :memos, only: [:index, :create]
  end

  # resources :users, only: :show

end

