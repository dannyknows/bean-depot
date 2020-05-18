# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
p 'resetting database'
Rake::Task["db:reset"]

p 'seeding 🌱'

p User.create(
  fname: "admin",
  lname: "adminer",
  email: "admin@admin.com",
  password: "password",
  password_confirmation: "password", 
  isAdmin: true,
  isProducer: false
  )

p 'admin created ⚡️'

p prod_user = User.create(
  fname: "producer",
  lname: "producer",
  email: "producer@producer.com",
  password: "password",
  password_confirmation: "password", 
  isAdmin: false,
  isProducer: true
  )

p 'test producer create 🧪'

if !(Origin.any?)
  ['ASIA', 'AFRICA', 'SOUTH AMERICA', 'CENTRAL AMERICA'].each do |name|
    Origin.create(
      country: name
    )
  end
  p 'created growing regions 🗺'
end

10.times do 
  User.create( 
  fname: Faker::Name.first_name,
  lname: Faker::Name.last_name,
  email: Faker::Internet.email,
  password: "password",
  password_confirmation: "password"
  )
end

p 'customers created 🙋‍♀️'

# 5.times do 
#   user = User.create( 
#   fname: Faker::Name.first_name,
#   lname: Faker::Name.last_name,
#   email: Faker::Internet.email,
#   password: "password",
#   password_confirmation: "password",
#   isProducer: true
#   )
# end

producer = Producer.create(
  user_id: prod_user.id,
  company_name: Faker::Company.name
)

p 'producers created 🚜'

# Producer.all.each do |producer|
5.times do 
  num = rand(1000..50000)
  grind = rand(0..3)
  Product.create(
    name: Faker::Coffee.blend_name,
    description: Faker::Coffee.notes,
    price: num, 
    producer_id: producer.id, 
    origin_id: 2, 
    grind_type: grind, 
    isDecaf: false
  )
end
# end

p 'products created 🥜'

User.all.each do |user|
  cart = Cart.create(
    user_id: user.id
  )
  products = Product.all
  4.times do
    rand_index = rand(0..(products.length-1))
    CartProduct.create(
      cart_id: cart.id,
      product_id: products[rand_index].id
    )
  end
end

p 'user carts created 🛒'

p 'seeding complete 🌴'

