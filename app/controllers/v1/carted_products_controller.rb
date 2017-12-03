class V1::CartedProductsController < ApplicationController

  def create
    cartedproduct = CartedProduct.new(
      status: "carted",
      user_id: current_user.id,
      product_id: params["product_id"],
      quantity: params["quantity"]
      )
    if cartedproduct.save
      render json: cartedproduct.as_json
    else
      render json: {errors: cartedproduct.errors.full_messages}, status: :bad_request
    end
  end

  def index
    cartedproducts = current_user.carted_products
    render json: cartedproducts.as_json
  end

  def destroy
    carted_product_id = params["id"]
    carted_product = CartedProduct.find_by(id: carted_product_id)
    carted_product.status = "removed"
    if carted_product.save
      render json: {message: "Product removed from cart"}
    end
  end

end
