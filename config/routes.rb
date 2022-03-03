Rails.application.routes.draw do

  # Sidekiq UI
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  namespace :api, :defaults => { :format => 'json' } do
    resources :products do
      patch :upload, on: :member
    end
  end

  root to: 'pages#index'
  match "*path", to: "pages#index", format: false, via: :get
end
