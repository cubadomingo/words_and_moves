RSpec.feature "Sign Out" do
  context "when a user clicks sign out" do
    scenario "the user is signed out successfully" do
      user = FactoryGirl.create :user
      sign_in user
      visit feed_path
      click_button("Sign Out")
      expect(page).to have_selector(".alert", text: "You've signed out!")
    end
  end
end