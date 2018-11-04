Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  resources :users do
    resources :chats, only: [:index, :show, :create]
    resources :products do
        get :buy
        put :approve
      resources :comments
      resources :offers
    end
  end

  resources :categories, only: [:index] do
    resources :products, only: [:index]
  end

  resources :messages, only:[:create]

  root to: "products#index"

  mount ActionCable.server => '/cable'
end