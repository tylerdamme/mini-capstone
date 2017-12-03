require "unirest"
require "pp"


jwt = ""

while true
  system "clear"

  puts "Welcome to the mini-captone app!"
  puts "Please select an option"
  puts "[1] View all games"
  puts "  [1.1] Search products by title"
  puts "  [1.2] Show all items by price"
  puts "[2] Add a game to the database" if jwt != ""
  puts "[3] Select an individual game" 
  puts "[4] Update the information for a game" if jwt != ""
  puts "[5] Delete a game from the database"  if jwt != ""
  puts "[6] View your cart" if jwt != ""
  puts 
  puts "[signup] Signup (create new user)"
  puts "[login] Login"
  puts "[logout] Logout"
  puts
  puts "[q] Quit"
  puts
  input_option = gets.chomp

  if input_option == "1"
    response = Unirest.get("http://localhost:3000/v1/products")
    products = response.body
    pp products
  elsif input_option == "1.1"
    print "Please enter search terms: "
    search_terms = gets.chomp
    puts "Here are the matching products"
    # response = Unirest.get("http://localhost:3000/v1/products?search=#{search_terms}")
    response = Unirest.get("http://localhost:3000/v1/products", parameters: {search: search_terms})
    products = response.body
    pp products
  elsif input_option == "1.2"
    response = Unirest.get("http://localhost:3000/v1/products", parameters: {search_price: :true})
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
    if product["errors"]
      puts "Your product has errors!"
      pp product["errors"]
    else
      puts "Your product has been successfully created!"
      pp product
    end
  elsif input_option == "3"
    print "Which id would you like to view? "
    product_id = gets.chomp
    response = Unirest.get("http://localhost:3000/v1/products/#{product_id}")
    product = response.body
    pp product
    print "Purchase item? (y/n): "
    purchase_input = gets.chomp
    if purchase_input == "y"
      print "How many copies would you like to add to your cart?: "
      quantity = gets.chomp
      params = {
        quantity: quantity,
        product_id: product_id
      }
      response = Unirest.post("http://localhost:3000/v1/cartedproducts", parameters: params)
      carted_products = response.body
      pp carted_products
    # elsif purchase_input == "n"
    end
  elsif input_option == "4"
    print "Which game would you like to update? id: "
    product_id = gets.chomp
    response = Unirest.get("http://localhost:3000/v1/products/#{product_id}")
    product = response.body
    params = {}
    print "Enter the updated game title (#{product["name"]}): "
    params["name"] = gets.chomp
    print "Enter the updated game console (#{product["console"]}): "
    params["console"] = gets.chomp
    print "Enter the updated game price (#{product["price"]}): "
    params["price"] = gets.chomp
    print "Enter the updated game image (#{product["image"]}): "
    params["image"] = gets.chomp
    print "Enter the updated game description (#{product["description"]}): "
    params["description"] = gets.chomp
    print "Enter true to make item in stock, or false if out of stock (#{product["instock"]}): "
    params["instock"] = gets.chomp
    params.delete_if { |_key, value| value.empty? }
    response = Unirest.patch("http://localhost:3000/v1/products/#{product_id}", parameters: params)
    product = response.body
    if product["errors"]
      puts "Your updated product has errors!"
      pp product["errors"]
    else
      puts "Your product was successfully updated!"
      pp product
    end
  elsif input_option == "5"
    puts "Which game would you like to delete?"
    product_id = gets.chomp
    response = Unirest.delete("http://localhost:3000/v1/products/#{product_id}")
    pp response.body
  elsif input_option == "6"
    response = Unirest.get("http://localhost:3000/v1/cartedproducts")
    carted_products = response.body
    pp carted_products
  elsif input_option == "signup"
    params = {}
    print "Enter a name: "
    params[:name] = gets.chomp
    print "Enter an email: "
    params[:email] = gets.chomp
    print "Enter a password: "
    params[:password] = gets.chomp
    print "Confirm password: "
    params[:password_confirmation] = gets.chomp
    response = Unirest.post("http://localhost:3000/v1/users", parameters: params)
    pp response.body
  elsif input_option == "login"
    puts "Login to the app"
    params = {}
    print "Email: "
    params[:email] = gets.chomp
    print "Enter password: "
    params[:password] = gets.chomp
    response = Unirest.post("http://localhost:3000/user_token",
    parameters: {auth: {email: params[:email], password: params[:password]}}  
    )
    pp response.body
    # Save the JSON web token from the response
    jwt = response.body["jwt"]
    # Include the jwt in the headers of any future web requests
    Unirest.default_header("Authorization", "Bearer #{jwt}")
  elsif input_option == "logout"
    jwt = ""
    Unirest.clear_default_headers()
  elsif input_option == "q"
    puts "Goodbye!"
    break
  end
  puts
  puts "Press enter to continue"
  gets.chomp
end


