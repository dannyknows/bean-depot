# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
p 'seeding 🌱'

p User.create(
  fname: "admin",
  email: "admin@admin.com",
  password: "password",
  password_confirmation: "password", 
  isAdmin: true,
  isProducer: true
  )

p 'admin created ⚡️'

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

5.times do 
  user = User.create( 
  fname: Faker::Name.first_name,
  lname: Faker::Name.last_name,
  email: Faker::Internet.email,
  password: "password",
  password_confirmation: "password",
  isProducer: true
  )
  producer = Producer.create(
    user_id: user.id,
    company_name: Faker::Company.name
  )
end

p 'producers created 🚜'

producers = Producer.all

producers.each do |producer|
  2.times do 
    num = rand(1000..50000)
    grind = rand(0..3)
    Product.create(
      price: num, 
      producer_id: producer.id, 
      origin_id: 2, 
      grind_type: grind, 
      isDecaf: false
    )
  end
end

p 'products created 🥜'

p 'seeding complete 🌴'

