Rails.application.routes.draw do
  root "products#index"
  get "products/cart", to: "products#cart"
  get "products/dcookies", to: "products#dcookies" 
  post 'products/put_in_cart/:id', to: 'products#put_in_cart', as: 'products_put_in_cart'
  resources :products
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end