Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    resources :purchases, only: [:index, :create]
    post "purchases/drop", to: "purchases#drop"
  end
end
