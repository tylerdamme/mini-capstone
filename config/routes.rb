Rails.application.routes.draw do
  post 'user_token' => 'user_token#create'
  namespace :v1 do

    post "/cartedproducts" => "carted_products#create"
    get "/cartedproducts" => "carted_products#index"
    delete "/cartedproducts/:id" => "carted_products#destroy"

    post "/users" => "users#create"
    get "/products" => "products#index"
    post "/products" => "products#create"
    get "/products/:id" => "products#show"
    patch "/products/:id" => "products#update"
    delete "/products/:id" => "products#destroy"
    
    post "/orders" => "orders#create"
    get "/orders" => "orders#index"
  end
end
