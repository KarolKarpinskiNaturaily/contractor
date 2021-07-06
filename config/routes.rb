Rails.application.routes.draw do
  resources :payment_requests, only: %i(index new create)

  root "payment_requests#index"
end
