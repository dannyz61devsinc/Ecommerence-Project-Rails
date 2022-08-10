# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user1 = User.create!(name: 'Danial', email: 'langah61@gmail.com', password: '123456')
                  #    user1.avatar.attach(io: File.open(Rails.root.join('app/assets/images/cat.jpg')),
                  # filename: 'cat.jpg')

user2 = User.create!(name: 'langah', email: 'danial.zaib@devsinc.com', password: '123456')

product1 = Product.create(name: 'lovely Cream',
                          description: 'This is one of the amazing cream in the world you gonna love it by now.', price: 500, user_id: user1.id)
product2 = Product.create(name: 'Health Cream',
                          description: 'This is one of the amazing cream in the world you gonna love it by now.', price: 1000, user_id: user2.id)

comment11 = Comment.create(body: 'This product is amazing', product_id: product1.id, user_id: user2.id)
comment12 = Comment.create(body: 'This product is amazing', product_id: product2.id, user_id: user2.id)

comment21 = Comment.create(body: 'This product is aweasome', product_id: product1.id, user_id: user1.id)
comment22 = Comment.create(body: 'This product is awesome', product_id: product2.id, user_id: user1.id)
