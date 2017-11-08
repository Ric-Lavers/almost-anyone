# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
def seed_image(file_name)
  File.open(File.join(Rails.root, "/app/assets/images/seed/#{file_name}"))
end
aeon = User.create! id: 1, email: "aeonknight@almost.anything.com", first_name: "Aeon", last_name: "Knight", :password => '123456', :password_confirmation => '123456'
aeon.save!

aeon = Profile.create! id: 1, user_id: 1, brand: "Almost Anything", location: "CBR", phone_number: "1234 5678", bio: "Aeon knight is out of sight and Almost Anything Does almost anything", image_data: seed_image("_=_ -04.png")
aeon.save!

user = User.create! :id => 2, :first_name => 'Thor', :last_name => 'Son of Oden', :email => 'thor@email.com', :password => '123456', :password_confirmation => '123456'
user.save!

thor = Profile.create! id: 2, user_id: 2, brand: "The Revengers", location: "Azgaurd", phone_number: "send a raven", bio: "As the Norse God of thunder and lightning, Thor wields one of the greatest weapons ever made, the enchanted hammer Mjolnir. While others have described Thor as an over-muscled, oafish imbecile, he's quite smart and compassionate. He's self-assured, and he would never, ever stop fighting for a worthwhile cause.", image_data: seed_image("thor.jpeg")
thor.save!



Genre.new(name: "Dubstep").save
Genre.new(name: "Techno").save
Genre.new(name: "House").save
Genre.new(name: "D&B").save
Genre.new(name: "Disco").save
Genre.new(name: "Rave").save
Genre.new(name: "Beats").save
Genre.new(name: "Electro").save

benga = Tour.create! id: 2, user_id: 1, title: "benga", description: "Dubstep Don", country: "Australia",  bio: "As a teenager he used to hang out at the Big Apple record shop in Croydon and make his own tunes at home on a PlayStation. The tunes caught the attention of dubstep producer Hatcha, who worked at the shop, and, by the age of 15, Benga had made his first record, \"Skank\", released on Big Apple's own record label. He was also one of the first dubstep producers when the style was emerging in the early 2000s. He has been featured on a variety of compilations including Mary Anne Hobbs's Warrior Dubz, Tempa's The Roots of Dubstep and the BBC Radio 1Xtra anniversary mix." , start_date: "2017-12-07 00:00:00", end_date: "2017-12-23 00:00:00", min_cost: 3000, max_cost: 6000, image_data: seed_image('benga.png')
benga.save!
# Tour.new(user_id: 2, title: "DJ Dope", description: "is the dopes", country: "Australia",  bio: "these guys are the real deal",start_date: "2018-01-06 00:00:00", end_date: "2018-01-21 00:00:00", min_cost: 2000, max_cost: 5000).save
