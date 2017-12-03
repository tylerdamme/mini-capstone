class Order < ApplicationRecord
  belongs_to :user
  # belongs_to :product
  has_many :carted_products
  has_many :products, through: :carted_products

  # def as_json
  #   {
  #   product_id: product.as_json,
  #   id: id,
  #   quantity: quantity,
  #   total: total
  #   }


  # end
end
