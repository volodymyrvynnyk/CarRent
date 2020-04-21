Rails.application.routes.draw do
  resources :line_items
  resources :carts
  root 'rent#index', as: 'rent/index'
  resources :cars
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
