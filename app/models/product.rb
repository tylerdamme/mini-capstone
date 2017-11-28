class Product < ApplicationRecord

  validates :name, uniqueness: true
  validates :name, :console, :price, presence: true
  validates :price, numericality: {greater_than: 0}
  validates :description, length: {maximum: 500}

  belongs_to :supplier
  # def supplier
  #   Supplier.find_by(id: supplier_id)
  # end

  has_many :images
  # def images
  #   Image.where(product_id: id)
  # end

  def is_discounted
    if price.to_i < 20
      true
    else
      false
    end
  end

  def tax
    (price.to_i * 0.09.to_f).round(2)
  end

  def total
    price.to_i + tax
  end

  def as_json
    {
    id: id,
    name: name,
    console: console,
    description: description,
    images: images.map { |image| image.url },
    price: price,
    tax: tax,
    total: total,
    is_discounted: is_discounted,
    instock: instock,
    supplier: supplier.as_json
    }
  end

end
