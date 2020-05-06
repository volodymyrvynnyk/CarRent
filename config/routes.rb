Rails.application.routes.draw do
  resources :orders
  resources :line_items
  resources :carts
  root 'rent#index', as: 'rent/index'
  resources :cars do
    get :who_bought, on: :member
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
