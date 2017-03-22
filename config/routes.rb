Rails.application.routes.draw do
  get 'sessions/new'

  get 'welcome/index'
  get 'user/signup',  to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

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
