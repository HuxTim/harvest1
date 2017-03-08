Rails.application.routes.draw do
  get 'welcome/index'
  get 'user/signup',  to: 'users#new'

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
