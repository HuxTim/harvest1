Rails.application.routes.draw do
  resources :store_market_relationships
  resources :requests
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
  get '/stores/new/markets', to: 'stores#ajax_search_markets'
  post '/market_images', to: 'market_image#ajax_create'
  post '/store_images', to: 'store_image#ajax_create'
  post '/product_images', to: 'product_image#ajax_create'
  delete '/market_images/:id', to: 'market_image#ajax_destory'
  delete '/store_images/:id', to: 'store_image#ajax_destory'
  delete '/product_images/:id', to: 'product_image#ajax_destory'
  get '/search', to: 'searches#index'

  resources :reviews
  resources :products
  resources :markets do
    resources :stores
    resources :market_reviews
  end

  resources :stores do
    resources :products
    resources :store_reviews
  end

  resources :stores
  resources :vendors
  resources :users
  resources :market_reviews
  resources :store_reviews

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	root 'welcome#index'
end
