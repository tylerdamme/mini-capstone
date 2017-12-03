class V1::OrdersController < ApplicationController
  before_action :authenticate_user

  def create
    carted_products = CartedProduct.where({status: "carted", user_id: current_user.id})

    sum = 0
    carted_products.each do |carted_product|
      sum += carted_product.quantity * carted_product.product.price
    end

    tax = sum * 0.09
    total = sum + tax
    
    order = Order.new(
      user_id: current_user.id,
      subtotal: sum,
      tax: tax,
      total: total
    )
    
    if order.save
      carted_products.update_all(status: "purchased", order_id: order.id)
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
