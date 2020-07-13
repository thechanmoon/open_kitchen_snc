# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Restaurant.destroy_all
Post.destroy_all
Comment.destroy_all

puts "Your data is destroyed"


 
#  User.create(email:'spencerblum@gmail.com', password: '1', first_name: 'Spencer', last_name: 'Blum', imageurl: "https://dl.airtable.com/.attachmentThumbnails/1ee9b5b0a9245281bd7857835ef256d8/ebb993b2",is_owner:true )
 User.create(email:'tiburon.special@gmail.com', password: '1', first_name: 'Tiburon', last_name: 'Special', imageurl: "https://upload.wikimedia.org/wikipedia/commons/thumb/4/46/Leonardo_Dicaprio_Cannes_2019.jpg/220px-Leonardo_Dicaprio_Cannes_2019.jpg",is_owner:true )
 User.create(email:'thechanmoon@gmail.com', password: '1', first_name: 'Chan', last_name: 'Park', imageurl: "https://upload.wikimedia.org/wikipedia/commons/thumb/4/46/Leonardo_Dicaprio_Cannes_2019.jpg/220px-Leonardo_Dicaprio_Cannes_2019.jpg",is_owner:true )
 User.create(email:'guest@test.com', password: '1', first_name: 'guest', last_name: 'guest', imageurl: "https://upload.wikimedia.org/wikipedia/commons/thumb/4/46/Leonardo_Dicaprio_Cannes_2019.jpg/220px-Leonardo_Dicaprio_Cannes_2019.jpg",is_owner:false )
#  User.create(email:'gcampbell391@gmail.com', password: '1', first_name: 'Gene', last_name: 'Campbell III', imageurl: "https://lp2.hm.com/hmgoepprod?set=quality[79],source[/06/75/06759a2455bbe1c07d625175d63a690dd60fb3bc.jpg],origin[dam],category[kids_boy8y_jeans_skinny],type[DESCRIPTIVESTILLLIFE],res[w],hmver[1]&call=url[file:/product/main]",is_owner:true )
#  User.create(email:'rhodunda@udel.edu', password: '1', first_name: 'Bryan', last_name: 'Rhodunda', imageurl: "https://ca.slack-edge.com/T02MD9XTF-UQ1EMP5H8-ce92f57fbb5e-512",is_owner:true )
#  User.create(email:'admin@gmail.com', password: '1', first_name: 'admin', last_name: 'open kitchen', imageurl: "https://dl.airtable.com/.attachmentThumbnails/1ee9b5b0a9245281bd7857835ef256d8/ebb993b2",is_owner:true )



10.times do
    User.create(email: Faker::Internet.email, password: '1234', first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, imageurl: "https://upload.wikimedia.org/wikipedia/commons/thumb/4/46/Leonardo_Dicaprio_Cannes_2019.jpg/220px-Leonardo_Dicaprio_Cannes_2019.jpg" )
end
puts "1"
10.times do
    Restaurant.create(name: Faker::Restaurant.name , description: Faker::Restaurant.description, website: "www.yelp.com", phonenumber: Faker::PhoneNumber.cell_phone , imageurl: "https://dl.airtable.com/.attachmentThumbnails/e90acd19635b360ba75a5e0d47cbef0f/d76972aa")
end

puts "2"

7.times do
    Post.create(title: Faker::Food.dish , message: Faker::Food.description, restaurant_id: Restaurant.all.sample.id)
end
puts "3"

   
        Like.create(user_id: User.first.id, post_id: Post.all.sample.id)
        Like.create(user_id: User.second.id, post_id: Post.all.sample.id)
        Like.create(user_id: User.third.id, post_id: Post.all.sample.id)
        Like.create(user_id: User.fourth.id, post_id: Post.all.sample.id)
    


    Comment.create(message: Faker::Restaurant.review, user_id: User.first.id, post_id: Post.all.sample.id)
    Comment.create(message: Faker::Restaurant.review, user_id: User.second.id, post_id: Post.all.sample.id)
    Comment.create(message: Faker::Restaurant.review, user_id: User.third.id, post_id: Post.all.sample.id)
    Comment.create(message: Faker::Restaurant.review, user_id: User.fourth.id, post_id: Post.all.sample.id)
    Comment.create(message: Faker::Restaurant.review, user_id: User.fifth.id, post_id: Post.all.sample.id)
    Comment.create(message: Faker::Restaurant.review, user_id: User.fifth.id, post_id: Post.all.sample.id)

puts "4"

puts "Your data is seeded"








