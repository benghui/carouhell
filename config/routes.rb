Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  resources :users do
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

  resources :chatrooms, only: [:new, :create, :show, :index]

  root to: "products#index"

  post '/messages/create', to: 'chatrooms#create_message', as: 'create_message'

  

  mount ActionCable.server => '/cable'
end