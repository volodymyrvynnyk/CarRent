Rails.application.routes.draw do
  get 'admin' => 'admin#index'
  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end

  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'

  resources :users
  resources :cars do
    get :who_bought, on: :member
  end


  scope '(:locale)' do
    resources :orders
    resources :line_items
    resources :carts
    root 'rent#index', as: 'rent/index'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
