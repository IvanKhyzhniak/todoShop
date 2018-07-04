Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    resources :sessions, only: [:create, :destroy]
    post "line_items/drop", to: "purchases#drop"
    resources :line_items, only: [:index, :create]
  end
end
