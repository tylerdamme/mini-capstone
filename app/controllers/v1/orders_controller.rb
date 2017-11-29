class V1::OrdersController < ApplicationController
  def create
    product = Product.find_by(id: params[:product_id])

    subtotal = product.price * params["quantity"]
    tax = subtotal * 0.09
    total = subtotal + tax

    order = Order.new(
      user_id: current_user.id,
      product_id: params["product_id"],
      quantity: params["quantity"],
      total: total

    )
  end
end
