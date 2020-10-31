Rails.application.routes.draw do
  get 'invoices/index'

  resources :vendors

  root 'invoices#index'
end
