Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    resources :purchases
    post "purchases/drop", to: "purchases#drop"
  end
end
