class Order < ApplicationRecord
  belongs_to :user
  belongs_to :product

  # def as_json
  #   {
  #   product_id: product.as_json,
  #   id: id,
  #   quantity: quantity,
  #   total: total
  #   }


  # end
end
