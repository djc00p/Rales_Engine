Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      namespace :merchants do
        get '/find', to: 'search#show', as: :find_merchant
        get '/find_all', to: 'search#index', as: :find_all_merchant
        get '/:id/items', to: 'items#index', as: :items
        get '/:id/invoices', to: 'invoices#index', as: :invoices
        get '/random', to: 'random#show', as: :random_merchant
      end
      resources :merchants, only: [:index, :show, :create, :update, :destroy]
    end
  end
end
