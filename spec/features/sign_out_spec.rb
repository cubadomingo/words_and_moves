RSpec.feature "Sign Out" do
  context "when a user clicks sign out" do
    scenario "the user is signed out successfully" do
      user = FactoryGirl.create :user
      # Required because signing out redirects to the first regions page
      region = FactoryGirl.create :region
      sign_in user
      visit root_path
      click_button("Sign Out")
      expect(page).to have_selector(".alert", text: "Signed out successfully.")
    end
  end
end
