# This will delete any existing rows from the Product and User tables
# so you can run the seed file multiple times without having duplicate entries in your database
puts "Deleting old data..."
Product.destroy_all
User.destroy_all

puts "Creating users..."
user1 = User.create(name: "Bono")
user2 = User.create(name: "Jimmy")
user3 = User.create(name: "Joanne")

puts "Creating products..."
product1 = Product.create(name: "Stapler", price: 10)
product2 = Product.create(name: "Whiteboard", price: 15)
product3 = Product.create(name: "Dry Erase Markers", price: 5)
product4 = Product.create(name: "Ballpoint Pens", price: 2)
product5 = Product.create(name: "Scotch Tape", price: 3)

puts "Creating reviews..."
# *****************************************************************
# * TODO: create reviews! Remember, a review belongs to a product *
# * and a review belongs to an user.                              *
# *****************************************************************
review1 = Review.create(comment: "Works Great!", star_rating: 5, product_id: product1.id, user_id: user1.id)
review1 = Review.create(comment: "Didn't like it", star_rating: 3, product_id: product1.id, user_id: user2.id)
review2 = Review.create(comment: "Never buying again", star_rating: 0, product_id: product3.id, user_id: user2.id)
review3 = Review.create(comment: "Doesn't really work...", star_rating: 2, product_id: product2.id, user_id: user3.id)
review4 = Review.create(comment: "Just okay", star_rating: 3, product_id: product4.id, user_id: user3.id)
review5 = Review.create(comment: "Arrived used", star_rating: 2, product_id: product5.id, user_id: user1.id)


puts "Seeding done!"