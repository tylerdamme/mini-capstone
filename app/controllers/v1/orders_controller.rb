class V1::OrdersController < ApplicationController
  before_action :authenticate_user

  def create
    products = CartedProduct.where({status: "carted", user_id: current_user.id})


    subtotal = products.price * params["quantity"].to_i
    tax = subtotal * 0.09
    total = subtotal + tax

    order = Order.new(
      user_id: current_user.id,
      subtotal: subtotal,
      tax: tax,
      total: total
    )
    if order.save
      render json: order.as_json
    else
      render json: {errors: order.errors.full_messages}, status: :bad_request
    end
  end

  def index
    orders = current_user.orders
    render json: orders.as_json
  end
end
