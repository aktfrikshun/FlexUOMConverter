Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"
  get "home/index" => "home#index"
  post "create" => "home#create"
  get "reset" => "home#delete"
  get "populate_response_to" => "home#list_compatible_units"

end
