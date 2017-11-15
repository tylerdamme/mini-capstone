require "unirest"


response = Unirest.get("http://localhost:3000/all_products")
products = response.body

puts "#{products}"