class V1::ProductsController < ApplicationController

  def index
    products = Product.all
    render json: products.as_json
  end

  def create
    product = Product.new(
      name: params["name"],
      console: params["console"],
      price: params["price"],
      image: params["image"],
      description: params["description"]
      )
    product.save
    render json: product.as_json
  end

  def show
    product_id = params["id"]
    product = Product.find_by(id: product_id)
    render json: product.as_json
  end

  def update
    product_id = params["id"]
    product = Product.find_by(id: product_id)
    product.name = params["name"]
    product.console = params["console"]
    product.price = params["price"]
    product.image = params["image"]
    product.description = params["description"]
    product.save
    render json: product.as_json
  end
end
