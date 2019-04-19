Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "homepages#index"

  resources :drivers

  resources :trips, except: [:index, :create]

  resources :passengers do
    resources :trips, only: [:create]
  end

  # get "/passengers/:passenger_id/trips", to: "trips#new", as: "passenger_trips"
  # patch "/passengers/:passenger_id/trips", to: "trips#new"
end
