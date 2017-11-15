Rails.application.routes.draw do
  get "/all_products" => "products#all_products_method"
  get "/first_product" => "products#first_product_method"
  get "/civilization" => "products#civilization_product_method"
end
