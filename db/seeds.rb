# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Idea.destroy_all

user = User.new( first_name: 'Cam', last_name: 'Scherman', email: 'camscherman@example.com')
user.password = 'supersecret'
user.save

20.times.each do
  user = User.new( first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email)
  user.password = 'supersecret'
  user.save
end
@users = User.all
100.times.each do
  user = @users.sample
  idea = Idea.create( title: Faker::MostInterestingManInTheWorld.quote , description: Faker::Lorem.paragraph, user: user )
  rand(1..6).times do
    idea.reviews.build( title: Faker::HitchhikersGuideToTheGalaxy.location, body: Faker::HitchhikersGuideToTheGalaxy.marvin_quote, user: @users.sample)
    idea.save
  end
end



puts(Cowsay.say("#{Idea.count} ideas in the database", :sheep))
