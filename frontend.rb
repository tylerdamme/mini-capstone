require "unirest"
require "pp"

system "clear"

puts "Welcome to the mini-captone app!"
puts "Please select an option"
puts "[1] View all games"
puts "[2] Add a game to the database"
puts "[3] Select an individual game" 
puts "[4] Update the information for a game"
puts "[5] Delete a game from the database"
input_option = gets.chomp

if input_option == "1"
  response = Unirest.get("http://localhost:3000/v1/products")
  products = response.body
  pp products
elsif input_option == "2"
  params = {}
  puts "Please enter your game title"
  params["name"] = gets.chomp
  puts "Please enter your game console"
  params["console"] = gets.chomp
  puts "Please enter the game price"
  params["price"] = gets.chomp
  puts "Please enter an image for your game"
  params["image"] = gets.chomp
  puts "Please enter a product description"
  params["description"] = gets.chomp
  response = Unirest.post("http://localhost:3000/v1/products", parameters: params)
  product = response.body
  pp product
elsif input_option == "3"
  print "Which id would you like to view? "
  product_id = gets.chomp
  response = Unirest.get("http://localhost:3000/v1/products/#{product_id}")
  product = response.body
  pp product
elsif input_option == "4"
  print "Which game would you like to update? id: "
  product_id = gets.chomp
  params = {}
  print "Enter the updated game title: "
  params["name"] = gets.chomp
  print "Enter the updated game console: "
  params["console"] = gets.chomp
  print "Enter the updated game price: "
  params["price"] = gets.chomp
  print "Enter the updated game image: "
  params["image"] = gets.chomp
  print "Enter the updated game description: "
  params["description"] = gets.chomp
  response = Unirest.patch("http://localhost:3000/v1/products/#{product_id}", parameters: params)
  product = response.body
  pp product
elsif input_option == "5"
  puts "Which game would you like to delete?"
  product_id = gets.chomp
  response = Unirest.delete("http://localhost:3000/v1/products/#{product_id}")
  pp response.body
end



