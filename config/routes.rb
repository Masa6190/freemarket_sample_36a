Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :items do
    collection do
      get 'items/get_category_children', defaults: { format: 'json' }
      get 'items/get_category_grandchildren', defaults: { format: 'json' }
    end
  end
  resources :users
  resources :card, only: [:new, :show] do
    collection do
      post 'show', to: 'card#show'
      post 'pay', to: 'card#pay'
      post 'delete', to: 'card#delete'
    end
  end
end


