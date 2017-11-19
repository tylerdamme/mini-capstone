class Product < ApplicationRecord
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
    name: name,
    console: console,
    description: description,
    image: image,
    price: price,
    tax: tax,
    total: total,
    is_discounted: is_discounted
  }
  end

end
