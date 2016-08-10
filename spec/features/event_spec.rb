RSpec.feature "Event" do
  let(:user) { FactoryGirl.create :user }
  let(:region) { FactoryGirl.create :region }
  let(:subregion) { FactoryGirl.create(:subregion, region: region) }
  let(:city) { FactoryGirl.create(:city, subregion: subregion) }
  let!(:event) { FactoryGirl.create(:event, city: city, title: "Test Event", body: "Test Event Body") }

  scenario "Create Event" do
    category = FactoryGirl.create(:category, name: "Comedy")
    count = Event.count
    sign_in user
    visit new_region_event_path(region.slug)
    fill_in "event[title]", with: "Kevin Hart: Laugh At My Pain"
    fill_in "event[body]", with: "Kevin Hart takes the stage in Washington DC to put on his most anticipated stand up to date"
    fill_in "event[venue]", with: "Verizon Center, Washington, D.C."
    fill_in "event[date]", with: "01/01/2016"
    fill_in "event[time]", with: "12:00 AM"
    select "Comedy", from: "event[category_id]"
    select city.name, from: "event[city_id]"
    click_button "Create Event"
    expect(page).to have_selector(".alert", text: "Thank you for creating an Event")
    expect(Event.count).to be > count
    expect(page).to have_content("Kevin Hart: Laugh At My Pain")
  end
  scenario "View Event" do
    sign_in user
    visit region_event_path(region.slug, event.slug)
    expect(page).to have_selector("h1", text: "Test Event")
    expect(page).to have_selector("p", text: "Test Event Body")
  end
end
