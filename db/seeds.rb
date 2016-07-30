# Adding test data
if ENV['RAILS_ENV'] != 'test'
  user = User.create!(email: "tmobaird@gmail.com", username: "tmobaird", first_name: "Thomas", last_name: "Baird", password: "testing")
  region = Region.create!(name: "DMV")
  subregion = Subregion.create!(name: "NoVA", region_id: region.id)
  city = City.create!(name: "Alexandria", subregion_id: subregion.id)
  user.preferred_cities << city
  user.preferred_regions << region
  user.save
  category = Category.create(name: "Sports")
  music = Category.create(name: "Music")
  city.events.create!(title: "Washington Nationals vs. Atlanta Braves", body: "The Washington Nationals play division Rival, Atlanta Braves in game 2 of a 3 game series", location: "Nats Park", event_date: DateTime.now + 5.days, category_id: category.id)
  region.posts.create!(title: "NWA Guide", body: "Top Songs: Straight Outta Compton, F*** The Police, Express Yourself, Gangsta Gangsta", category_id: music.id)
end