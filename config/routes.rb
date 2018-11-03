Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  resources :users do
    resources :products do
        patch :buy
      resources :comments
    end
  end

  resources :categories, only: [:index] do
    resources :products, only: [:index]
  end

  resources :messages
  
  root to: "products#index"

  mount ActionCable.server => '/cable'
end