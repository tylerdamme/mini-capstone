# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
product = Product.new({name: "Super Mario Odyssey", console: "Nintendo Switch", price: "59", image: "https://media.nintendo.com/nintendo/bin/SmENxSXqVepjMBF5NxYddvUr6gSfLeDn/qSG2l7_qvitLVncMwzncZbBoqANeYYL6.png", description: "New Mario game for the Switch"})
product.save
Product.create({name: "Civilization VI", console: "PC", price: "49", image: "https://upload.wikimedia.org/wikipedia/en/3/3b/Civilization_VI_cover_art.jpg", description: "The sixth edition of the Sid Meier classic"})
Product.create({name: "Zelda: Breath of the Wild", console: "Nintendo Switch", price: "59", image: "https://cdn.vox-cdn.com/uploads/chorus_asset/file/7802443/NintendoSwitch_TLOZBreathoftheWild_boxart.jpg", description: "New Zelda game for the Switch"})