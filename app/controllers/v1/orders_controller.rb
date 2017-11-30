class V1::OrdersController < ApplicationController
  def create
    product = Product.find_by(id: params[:product_id])

    subtotal = product.price * params["quantity"].to_i
    tax = subtotal * 0.09
    total = subtotal + tax

    order = Order.new(
      user_id: current_user.id,
      product_id: params["product_id"],
      quantity: params["quantity"],
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
