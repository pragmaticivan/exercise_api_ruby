Rails.application.routes.draw do
  root to: 'status#index'
  mount API => '/'
end
