RSpec.feature "Subscribing" do
  let(:user) { FactoryGirl.create :user }
  let(:region) { FactoryGirl.create :region }

  context "When user subscribes to a region" do
    it "shows up in feed" do
      region
      sign_in user
      visit regions_path
      click_on('Subscribe')
      visit feed_path
      expect(page).to have_content(region.name)
    end
  end

  context "when user unsubscribes from a region" do
    it "does not show up in feed anymore" do
      region
      sign_in user
      visit regions_path
      click_on('Subscribe')
      visit feed_path
      expect(page).to have_content(region.name)
      visit regions_path
      click_on('unsubscribe')
      visit feed_path
      expect(page).to have_no_content(region.name)
    end
  end
end
