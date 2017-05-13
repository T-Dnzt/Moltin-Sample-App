Rails.application.routes.draw do
  resources :products
  resources :carts, only: [:index] do
    collection do
      patch '/add/:product_id', to: 'carts#add', as: :add
      patch '/remove/:cart_item_id', to: 'carts#remove', as: :remove
    end
  end

  root to: 'products#index'
end
