RSpec.feature "Subscribe" do
  # Made all pending because the subscribe page seems to be no longer active or the root
  let!(:region) { FactoryGirl.create :region }
  xcontext "when using valid email" do
    it "allows user to subscribe" do
      subscriber = FactoryGirl.build(:subscriber)
      visit subscribe_path
      fill_in "subscriber_email", with: subscriber.email
      click_button "Subscribe"
      expect(page).to have_content("Thanks for subcribing!")
    end
  end
  xcontext "when email field is blank" do
    it "does not allow user to subscribe" do
      visit subscribe_path
      click_button "Subscribe"
      expect(page).to have_content("Please enter a valid email address!")
    end
  end
  xcontext "when email is already subscribed" do
    it "does not allow user to subscribe again" do
      subscriber = FactoryGirl.create(:subscriber)
      visit subscribe_path
      fill_in "subscriber_email", with: subscriber.email
      click_button "Subscribe"
      expect(page).to have_content("You are already subscribed!")
    end
  end
end
