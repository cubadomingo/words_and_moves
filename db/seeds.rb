# Adding test data
if ENV['RAILS_ENV'] != 'test'
  user = User.create!(email: "tmobaird@gmail.com", username: "tmobaird", first_name: "Thomas", last_name: "Baird", password: "testing")
  user_two = User.create!(email: "testuser@gmail.com", username: "testuser", first_name: "Test", last_name: "User", password: "testing")
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
  user_two.preferred_regions << region
  user_two.save
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
      venue: Faker::Company.name,
      date: Faker::Time.between(Date.today, Date.today + 365),
      time: Faker::Time.between(Time.now, Time.now + 24),
      city_id: city.id,
      user_id: user.id
    )
  end

  x = 0
  5.times do
    Comment.create!(item_id: city.events[x].id, item_type: city.events[x].class, body: Faker::Hipster.paragraph, user_id: user_two.id)
    x += 1
  end

  10.times do
    city.events.create!(
      title: Faker::Hipster.sentence(7),
      body: Faker::Hipster.paragraph,
      venue: Faker::Company.name,
      date: Faker::Time.between(Date.today, Date.today + 365),
      time: Faker::Time.between(Time.now, Time.now + 24),
      category_id: art.id,
      city_id: city2.id,
      user_id: user.id
    )
  end

  10.times do
    city.events.create!(
      title: Faker::Hipster.sentence(7),
      body: Faker::Hipster.paragraph,
      venue: Faker::Company.name,
      date: Faker::Time.between(Date.today, Date.today + 365),
      time: Faker::Time.between(Time.now, Time.now + 24),
      category_id: art.id,
      city_id: city3.id,
      user_id: user.id
    )
  end

  10.times do
    city.events.create!(
      title: Faker::Hipster.sentence(7),
      body: Faker::Hipster.paragraph,
      venue: Faker::Company.name,
      date: Faker::Time.between(Date.today, Date.today + 365),
      time: Faker::Time.between(Time.now, Time.now + 24),
      category_id: art.id,
      city_id: city4.id,
      user_id: user.id
    )
  end

  10.times do
    city.events.create!(
      title: Faker::Hipster.sentence(7),
      body: Faker::Hipster.paragraph,
      venue: Faker::Company.name,
      date: Faker::Time.between(Date.today, Date.today + 365),
      time: Faker::Time.between(Time.now, Time.now + 24),
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

  x = 0
  5.times do
    Comment.create!(item_id: region.posts[x].id, item_type: region.posts[x].class, body: Faker::Hipster.paragraph, user_id: user_two.id)
    x += 1
  end
end
