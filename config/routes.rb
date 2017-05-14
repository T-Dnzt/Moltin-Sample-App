Rails.application.routes.draw do
  resources :products
  resources :carts, only: [:index] do
    collection do
      post '/add/:product_id', to: 'carts#add', as: :add
      delete '/remove/:cart_item_id', to: 'carts#remove', as: :remove
    end
  end

  get '/checkout', to: 'checkout#index', as: 'checkout'
  post '/checkout', to: 'checkout#create', as: 'create_checkout'
  get '/payment', to: 'checkout#payment', as: 'payment'
  post '/pay', to: 'checkout#pay', as: 'pay'
  get '/confirm', to: 'checkout#confirm', as: 'confirm'

  root to: 'products#index'
end
