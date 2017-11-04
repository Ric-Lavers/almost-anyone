# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.new(id: 2, email: "seed@email.com", created_at: "2017-11-04 04:31:35", updated_at: "2017-11-04 04:31:35", first_name: "first", last_name: "last") 


Genre.new(name: "Dubstep").save
Genre.new(name: "Techno").save
Genre.new(name: "House").save
Genre.new(name: "D&B").save
Genre.new(name: "Disco").save
Genre.new(name: "Rave").save
Genre.new(name: "Beats").save
Genre.new(name: "Electro").save

Tour.new(user_id: 2, title: "DJ Dope", description: "is the dopes", country: "Australia",  bio: "these guys are the real deal", start_date: datetime, end_date: datetime, min_cost: integer, max_cost: integer, created_at: datetime, updated_at: datetime)
