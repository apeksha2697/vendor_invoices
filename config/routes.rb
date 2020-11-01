Rails.application.routes.draw do
  get 'invoices/summary'

  resources :invoices do
    collection {post :import}
  end

  resources :vendors 
  root to: 'invoices#index'
end
