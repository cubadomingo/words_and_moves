RSpec.feature "Subscribe" do
  context "when using valid email" do
    it "allows user to subscribe" do
      subscriber = FactoryGirl.build(:subscriber)
      visit root_path
      fill_in "subscriber_email", with: subscriber.email
      click_button "Subscribe"
      expect(page).to have_content("Thanks for subcribing!")
    end
  end
  context "when email field is blank" do
    it "does not allow user to subscribe" do
      visit root_path
      click_button "Subscribe"
      expect(page).to have_content("Please enter a valid email address!")
    end
  end
  context "when email is already subscribed" do
    it "does not allow user to subscribe again" do
      subscriber = FactoryGirl.create(:subscriber)
      visit root_path
      fill_in "subscriber_email", with: subscriber.email
      click_button "Subscribe"
      expect(page).to have_content("You are already subscribed!")
    end
  end
end