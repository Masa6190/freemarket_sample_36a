Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :items do
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
    member do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
      resources :buyers, only: [:index] do
        collection do
          post 'pay', to: 'buyers#pay'
          get 'done', to: 'buyers#done'
        end
      end
    end
  end
  resources :users, only: [:show, :edit]
  resources :addresses, only: [:new, :create]
  resources :card, only: [:new, :show] do
    collection do
      post 'show', to: 'card#show'
      post 'pay', to: 'card#pay'
      post 'delete', to: 'card#delete'
    end
  end
end


