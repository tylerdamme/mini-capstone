class Category < ApplicationRecord
  has_many :category_products

  has_many :products, through: :category_products
  # def products
  #   category_products.map {|category_product| category_product.product}
  # end

  def as_json
    {
      id: id,
      name: name,
      products: products.map {|product| product.name}
    }
  end
end
