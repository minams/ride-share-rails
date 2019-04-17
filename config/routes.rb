Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "homepages#index"

  get "/", to: "trips#index", as: "homepages"

  get "/passengers", to: "passengers#index"

  get "/passengers/new", to: "passengers#new", as: "new_passenger"

  get "/passengers/:id/edit", to: "passengers#edit", as: "edit_passenger"

  get "/passengers/:id", to: "passengers#show", as: "passenger"

  patch "passengers/:id", to: "passengers#update"

  post "passengers", to: "passengers#create"

  delete "/passengers/destroy/:id", to: "passengers#destroy", as: "delete_passenger"

  get "/drivers", to: "drivers#index"

  get "/drivers/new", to: "drivers#new", as: "new_driver"

  get "/drivers/:id/edit", to: "drivers#edit", as: "edit_driver"

  get "drivers/:id", to: "drivers#show", as: "driver"

  patch "drivers/:id", to: "drivers#update"

  post "/drivers", to: "drivers#create"

  delete "/drivers/destroy/:id", to: "drivers#destroy", as: "delete_driver"
end
