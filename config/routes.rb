Rails.application.routes.draw do
  devise_for :users

  resources :exchange_rate_subscriptions, only: %i[new create]
end
