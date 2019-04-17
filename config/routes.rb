Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "homepages#index"

  resources :drivers
  # get "/drivers/index", to: "drivers#index"

  resources :passengers

  resources :homepages
  # get "/passengers", to: "passengers#index", as: "passengers"

  # get "passengers/new", to: "passengers#new", as: "new_passenger"
  # post "/passengers", to: "passengers#create"

  # get "/passengers/:id", to: "passengers#show", as: "passenger"

  # get "/passengers/:id/edit", to: "passengers#edit", as: "edit_passenger"
  # patch "/passengers/:id", to: "passengers#update"

  # patch "/passengers/:id/mark_available", to: "passengers#mark_available", as: "mark_available"
  # patch "/passengers/:id/mark_unavailable", to: "passengers#mark_unavailable", as: "mark_unavailable"

  # delete "/passengers/:id", to: "passengers#destroy"
end
