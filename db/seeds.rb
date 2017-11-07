# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = User.create! :id => 2, :first_name => 'Thor', :last_name => 'Son of Oden', :email => 'thor@email.com', :password => '123456', :password_confirmation => '123456'
user.save!

Genre.new(name: "Dubstep").save
Genre.new(name: "Techno").save
Genre.new(name: "House").save
Genre.new(name: "D&B").save
Genre.new(name: "Disco").save
Genre.new(name: "Rave").save
Genre.new(name: "Beats").save
Genre.new(name: "Electro").save

Tour.new(user_id: 2, title: "DJ Dope", description: "is the dopes", country: "Australia",  bio: "these guys are the real deal",start_date: "2018-01-06 00:00:00", end_date: "2018-01-21 00:00:00", min_cost: 2000, max_cost: 5000).save
