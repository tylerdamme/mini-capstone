class ProductsController < ApplicationController

  def all_products_method
    products = Product.all
    render json: products.as_json
  end

  def first_product_method
    first_product = Product.first
    render json: first_product.as_json
  end

  def civilization_product_method
    civilization = Product.find_by(name: "Civilization VI")
    render json: civilization.as_json
  end
end
