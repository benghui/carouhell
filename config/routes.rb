Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  resources :users do
    resources :products do
      resources :comments
    end
  end

  resources :categories do
    resources :products 
  end

  patch 'users/:user_id/products/:id', to: 'products#buy', as: :buy_products

  root to: "products#index"
end