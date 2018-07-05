Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    resource :sessions, only: [:create, :destroy]
    resources :line_items, only: [:index, :create]
  end
end
