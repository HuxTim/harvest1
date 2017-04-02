Rails.application.routes.draw do
  get 'sessions/new'

  get 'welcome/index'
  get 'user/signup',  to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get  '/cities',  to: 'application#cities'
  get '/markets/:id/reviews', to: 'markets#ajax_reviews'
  get '/markets/:id/stores', to: 'markets#ajax_stores'
  get '/stores/:id/reviews', to: 'stores#ajax_reviews'
  get '/stores/:id/products', to: 'stores#ajax_products'

  resources :reviews
  resources :products
  resources :markets do
    resources :stores
  end

  resources :stores
  resources :vendors
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	root 'welcome#index'
end
