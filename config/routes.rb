Rails.application.routes.draw do
  
  root 'welcome#index'
#system generated resources
  resources :products
  resource :cart, only: [:show]
  resources :order_items, only: [:create, :update, :destroy]
  resources :billings
  resources :checkouts
  resources :charges
  
#custom Views
  get '/story', to: 'welcome#story'
  get '/info', to: 'welcome#info'
  get '/admin', to: 'admin#show'
  get '/custom_order', to: 'custom_orders#new'
 
end
