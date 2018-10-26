Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  resources :users do
    resources :products do
      resources :comments
    end
  end

  resources :products do
    resources :users
    resources :comments
    resources :categories
  end

  root to: "products#index"
end
