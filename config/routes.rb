Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    delete "/sessions", to: 'sessions#destroy'
    resources :sessions, only: [:create]
    resources :line_items, only: [:index, :create]
  end
end
