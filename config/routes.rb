Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :merchants, only: [:index, :show]
    end
    namespace :merchants do
      get '/find', to: 'search#show', as: :find_merchant
      get '/find_all', to: 'search#index', as: :find_all_merchant
      get '/random', to: 'random#show', as: :random_merchant
      get '/most_revenue', to: 'most_revenue#show', as: :most_revenue
      get '/most_items', to: 'most_items#show', as: :most_items
      get '/:id/favorite_customer', to: 'favorite_customer#show', as: :favorite_customer
      get '/revenue', to: 'revenue#index', as: :total_revenue
      get '/:id/items', to: 'items#index', as: :items
      get '/:id/invoices', to: 'invoices#index', as: :invoices
      get '/:id/revenue', to: 'revenue#show', as: :revenue
    end

      namespace :invoices do
        get '/find', to: 'search#show', as: :find_invoice
        get '/find_all', to: 'search#index', as: :find_all_invoices
        get '/random', to: 'random#show', as: :random_invoice
        get '/:id/transactions', to: 'transactions#index', as: :transactions
        get '/:id/invoice_items', to: 'invoice_items#index', as: :invoice_items
        get '/:id/items', to: 'items#index', as: :items
        get '/:id/customer', to: 'customer#show', as: :customer
        get '/:id/merchant', to: 'merchant#show', as: :merchant
      end
      resources :invoices, only: [:index, :show]

      namespace :invoice_items do
        get '/find', to: 'search#show', as: :find_invoice_item
        get '/find_all', to: 'search#index', as: :find_all_invoice_items
        get '/random', to: 'random#show', as: :random_invoice_item
        get '/:id/invoice', to: 'invoice#show', as: :invoice
        get '/:id/item', to: 'item#show', as: :item
      end
      resources :invoice_items, only: [:index, :show]

      namespace :items do
        get '/:id/best_day', to: 'best_day#show', as: :best_day
        get '/find', to: 'search#show', as: :find_item
        get '/find_all', to: 'search#index', as: :find_all_items
        get '/random', to: 'random#show', as: :random_item
        get '/most_items', to: 'most_items#show', as: :most_items
        get '/most_revenue', to: 'most_revenue#show', as: :most_revenue
        get '/:id/merchant', to: 'merchant#show', as: :merchant
        get '/:id/invoice_items', to: 'invoice_items#index', as: :invoice_items
      end
      resources :items, only: [:index, :show]

      namespace :transactions do
        get '/find', to: 'search#show', as: :find_transaction
        get '/find_all', to: 'search#index', as: :find_all_transactions
        get '/random', to: 'random#show', as: :random_transaction
        get '/:id/invoice', to: 'invoice#show', as: :invoice
      end
      resources :transactions, only: [:index, :show]

      namespace :customers do
        get '/find', to: 'search#show', as: :find_customer
        get '/find_all', to: 'search#index', as: :find_all_customers
        get '/random', to: 'random#show', as: :random_customer
        get '/:id/favorite_merchant', to: 'favorite_merchant#show', as: :favorite_merchant
        get '/:id/invoices', to: 'invoices#index', as: :invoices
        get '/:id/transactions', to: 'transactions#index', as: :transactions
      end
      resources :customers, only: [:index, :show]
    end
  end
end
