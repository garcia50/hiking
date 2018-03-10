Rails.application.routes.draw do
  root to: "trips#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :trips, only: [:index, :show]
  resources :trails, only: [:show]
end
