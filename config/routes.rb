Rails.application.routes.draw do
  root to: 'status#index'

  resources :loans, defaults: {format: :json}
end
