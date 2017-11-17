class V1::ProductsController < ApplicationController

  def index
    products = Product.all
    render json: products.as_json
  end

  def create
    product = Product.new(
      name: params["title"],
      console: params["console"],
      price: params["price"],
      image: params["image"],
      description: params["description"]
      )
  end

  def show
    product_id = params["id"]
    product = Product.find_by(id: product_id)
    render json: product.as_json
  end
end
