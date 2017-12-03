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

end
