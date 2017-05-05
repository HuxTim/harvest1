Rails.application.routes.draw do
  root 'welcome#index'
  get 'sessions/new'

  get 'user/signup',  to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  get  '/cities',  to: 'application#cities'
  delete '/logout',  to: 'sessions#destroy'

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

  get '/markets/:id/store_market_relationships/new', to: 'store_market_relationships#new'

  get '/search', to: 'searches#index'
  get '/users/:id/edit', to: 'users#edit'
  get '/users/:id/change_password', to: 'users#change_password', as: 'change_password'


  get '/users/:id/shopping_list', to: 'users#shopping_list', as: 'shopping_list'
  get '/users/:id/requests', to: 'users#requests', as: 'user_requests'
  get '/users/:id/markets', to: 'users#markets', as: 'user_markets'
  get '/users/:id/reviews', to: 'users#reviews', as: 'user_reviews'
  get '/users/:id/store/new', to: 'users#bevendor', as: 'bevendor'
  patch '/users/:id/update_password', to: 'users#update_password'

  %w(404 422 500).each do |code|
    get code, to: "application#error", code: code
  end


  resources :markets do
    resources :stores
    resources :market_reviews
  end

  resources :stores do
    resources :products
    resources :store_reviews
  end

  resources :users do
    resources :shopping_lists
    resources :markets
    resources :store_reviews
    resources :market_reviews
    resources :requests
  end

  resources :products do
    resources :shopping_lists
  end

  resources :shopping_lists
  resources :stores
  resources :vendors
  resources :users
  resources :market_reviews
  resources :store_reviews
  resources :store_market_relationships
  resources :requests
  resources :products

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
