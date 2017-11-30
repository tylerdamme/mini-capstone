class V1::ProductsController < ApplicationController
  before_action :authenticate_admin, except: [:index, :show]


  def index
    products = Product.all.order(:id => :asc)
    if params[:search]
      products = products.where("name ILIKE ?", "%#{params[:search]}%")
    elsif params[:search_price]
      products = Product.order(:price => :asc)
    end
    render json: products.as_json
  end

  def create
    product = Product.new(
      name: params["name"],
      console: params["console"],
      price: params["price"],
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
