require 'sidekiq/web'

Rails.application.routes.draw do
  devise_for :users

  mount Sidekiq::Web => '/sidekiq'

  root 'exchange_rate_subscriptions#index'

  get 'history_exchange_rates/current_rate', to: 'history_exchange_rates#current_rate'
  resources :history_exchange_rates, only: :index
  resources :exchange_rate_subscriptions, only: %i[index new create destroy]
end
