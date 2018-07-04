Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    resource :session, only: [:create, :destroy]
    post "purchases/drop", to: "purchases#drop"
    resources :purchases, only: [:index, :create]
  end
end
