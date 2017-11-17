Rails.application.routes.draw do
  namespace :v1 do
    get "/products" => "products#index"
    post "/products" => "poducts#create"
    get "/products/:id" => "products#show"
  end
end
