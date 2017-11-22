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
      description: params["description"],
      instock: params["instock"]
      )
    if product.save
      render json: product.as_json
    else
      render json: {errors: product.errors.full_messages}, status: :bad_request
    end
  end

  def show
    product_id = params["id"]
    product = Product.find_by(id: product_id)
    render json: product.as_json
  end

  def update
    product_id = params["id"]
    product = Product.find_by(id: product_id)
    product.name = params["name"] || product.name
    product.console = params["console"] || product.console
    product.price = params["price"] || product.price
    product.image = params["image"] || product.image
    product.description = params["description"] || product.description
    product.instock = params["instock"] || product.instock
    if product.save
      render json: product.as_json
    else
      render json: {errors: product.errors.full_messages}, status: :bad_request
    end
  end

  def destroy
    product_id = params["id"]
    product = Product.find_by(id: product_id)
    product.destroy
    render json: {message: "Product successfully deleted!"}
  end
end
