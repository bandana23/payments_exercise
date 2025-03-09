Rails.application.routes.draw do
  # get 'payments/index'
  # get 'payments/show'
  # get 'payments/create'
  # resources :loans, defaults: {format: :json}
  # re
    resources :loans,only: [:index,:show] do
        resources :payments,only: [:index,:create,:show]
    end

end