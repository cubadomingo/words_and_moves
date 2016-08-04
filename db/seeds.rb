# Adding test data
if ENV['RAILS_ENV'] != 'test'
  user = User.create!(email: "tmobaird@gmail.com", username: "tmobaird", first_name: "Thomas", last_name: "Baird", password: "testing")
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
  category = Category.create(name: "Sports")
  music = Category.create(name: "Music")
  code = Category.create(name: "Code")
  fashion = Category.create(name: "Fashion")
  films = Category.create(name: "Film")
  art = Category.create(name: "Arts")

  10.times do
    city.events.create!(
      title: Faker::Hipster.sentence(7),
      body: Faker::Hipster.paragraph,
      location: Faker::Company.name,
      event_date: Faker::Time.between(DateTime.now, DateTime.now + 365),
      category_id: art.id,
      city_id: city.id,
      user_id: user.id
    )
  end

  10.times do
    city.events.create!(
      title: Faker::Hipster.sentence(7),
      body: Faker::Hipster.paragraph,
      location: Faker::Company.name,
      event_date: Faker::Time.between(DateTime.now, DateTime.now + 365),
      category_id: art.id,
      city_id: city2.id,
      user_id: user.id
    )
  end

  10.times do
    city.events.create!(
      title: Faker::Hipster.sentence(7),
      body: Faker::Hipster.paragraph,
      location: Faker::Company.name,
      event_date: Faker::Time.between(DateTime.now, DateTime.now + 365),
      category_id: art.id,
      city_id: city3.id,
      user_id: user.id
    )
  end

  10.times do
    city.events.create!(
      title: Faker::Hipster.sentence(7),
      body: Faker::Hipster.paragraph,
      location: Faker::Company.name,
      event_date: Faker::Time.between(DateTime.now, DateTime.now + 365),
      category_id: art.id,
      city_id: city4.id,
      user_id: user.id
    )
  end

  10.times do
    city.events.create!(
      title: Faker::Hipster.sentence(7),
      body: Faker::Hipster.paragraph,
      location: Faker::Company.name,
      event_date: Faker::Time.between(DateTime.now, DateTime.now + 365),
      category_id: art.id,
      city_id: city5.id,
      user_id: user.id
    )
  end

  50.times do
    region.posts.create!(
      title: Faker::Hipster.sentence(7),
      body: Faker::Hipster.paragraph,
      category_id: art.id,
      user_id: user.id,
      region_id: region.id
    )
  end

  city.events.create!(title: "Washington Nationals vs. Atlanta Braves", body: "The Washington Nationals play division Rival, Atlanta Braves in game 2 of a 3 game series", location: "Nats Park", event_date: DateTime.now + 5.days, category_id: category.id)
  region.posts.create!(title: "NWA Guide", body: "Top Songs: Straight Outta Compton, F*** The Police, Express Yourself, Gangsta Gangsta", category_id: music.id)
end
