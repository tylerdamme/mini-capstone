require "unirest"
require "pp"

response = Unirest.get("http://localhost:3000/v1/all_products")
products = response.body

pp products