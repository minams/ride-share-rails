Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "homepages#index"

  resources :drivers

  get "/trips/:id", to: "trips#show", as: "trip"

  get "/trips/:id/edit", to: "trips#edit", as: "edit_trip"
  patch "/trips/:id", to: "trips#update"

  delete "trips/:id", to: "trips#destroy"

  resources :passengers do
    resources :trips, only: [:new]
  end

  get "/passengers/:passenger_id/trips", to: "trips#new", as: "passenger_trips"
  patch "/passengers/:passenger_id/trips", to: "trips#new"
end
