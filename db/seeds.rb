# Adding test data
if ENV['RAILS_ENV'] != 'test'
  user = User.create!(email: "tmobaird@gmail.com", username: "tmobaird", password: "testing")
  region = Region.create!(name: "DC Metro Area")
  subregion = Subregion.create!(name: "Northern Virginia", region_id: region.id)
  subregion2 = Subregion.create!(name: "Southern Maryland", region_id: region.id)
  subregion3 = Subregion.create!(name: "Washington DC", region_id: region.id)
  city = City.create!(name: "Alexandria", subregion_id: subregion.id)
  city2 = City.create!(name: "Arlington", subregion_id: subregion.id)
  city3 = City.create!(name: "Bethesda", subregion_id: subregion2.id)
  city4 = City.create!(name: "Silver Spring", subregion_id: subregion2.id)
  city5 = City.create!(name: "Washington D.C.", subregion_id: subregion3.id)
  user.preferred_regions << region
  user.save

  user2 = User.create!(email: "me@devinosor.io", username: "cubadomingo", password: "testing")
  region2 = Region.create!(name: "SF Bay Area")
  sf_subregion = Subregion.create!(name: "San Francisco", region_id: region2.id)
  sf_subregion2 = Subregion.create!(name: "North Bay", region_id: region2.id)
  sf_subregion3 = Subregion.create!(name: "East Bay", region_id: region2.id)
  sf_subregion4 = Subregion.create!(name: "South Bay", region_id: region2.id)
  sf_subregion5 = Subregion.create!(name: "Peninsula", region_id: region2.id)

  sf_city = City.create!(name: "San Francisco", subregion_id: sf_subregion.id)
  sf_city2 = City.create!(name: "Oakland", subregion_id: sf_subregion3.id)
  sf_city3 = City.create!(name: "Berkeley", subregion_id: sf_subregion3.id)
  sf_city4 = City.create!(name: "Santa Rosa", subregion_id: sf_subregion2.id)
  sf_city5 = City.create!(name: "San Rafael", subregion_id: sf_subregion2.id)
  sf_city6 = City.create!(name: "San Jose", subregion_id: sf_subregion4.id)
  sf_city7 = City.create!(name: "Santa Clara", subregion_id: sf_subregion4.id)
  sf_city8 = City.create!(name: "Palo Alto", subregion_id: sf_subregion5.id)
  sf_city8 = City.create!(name: "Mountain View", subregion_id: sf_subregion5.id)
  user2.preferred_regions << region2
  user2.save

  category = Category.create(name: "Sports")
  music = Category.create(name: "Music")
  code = Category.create(name: "Code")
  fashion = Category.create(name: "Fashion")
  films = Category.create(name: "Film")
  art = Category.create(name: "Arts")

  10.times do
    city5.events.create!(
      title: "The Roots",
      body: "The Roots are coming back to the Verizon ceneter for the second time!",
      venue: "Verizon Center",
      date: Faker::Time.between(Date.today, Date.today + 365),
      time: Faker::Time.between(Time.now, Time.now + 24),
      city_id: city5.id,
      user_id: user.id
    )
  end

   10.times do
    sf_city.events.create!(
      title: "Lil Yachty",
      body: "Lil Yachty brings his crew and hot trap beats to the SF Bay in this sold out show",
      venue: "The Warfield",
      date: Faker::Time.between(Date.today, Date.today + 365),
      time: Faker::Time.between(Time.now, Time.now + 24),
      city_id: sf_city.id,
      user_id: user2.id
    )
  end
end
