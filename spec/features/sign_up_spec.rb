RSpec.feature "Sign Up" do
  it "Registers a new user successfully" do
    user_count = User.count
    visit new_user_session_path
    within(".sign-up") do
      fill_in "user_email", with: "test_email@wordsandmoves.com"
      fill_in "user_username", with: "test_user"
      fill_in "user_first_name", with: "Test"
      fill_in "user_last_name", with: "User"
      fill_in "user_password", with: "testing"
      fill_in "user_password_confirmation", with: "testing"
      click_button "Sign up"
    end
    expect(page).to have_selector(".alert", text: "You've signed up!")
    expect(page).to have_current_path(feed_path)
    expect(User.count).to be > user_count
  end
  context "when user has already signed up with email" do
    it "encounters an error when attempting to sign up" do
      FactoryGirl.create(:user, email: "test_email@wordsandmoves.com")
      visit new_user_session_path
      within(".sign-up") do
        fill_in "user_email", with: "test_email@wordsandmoves.com"
        fill_in "user_username", with: "test_user"
        fill_in "user_first_name", with: "Test"
        fill_in "user_last_name", with: "User"
        fill_in "user_password", with: "testing"
        fill_in "user_password_confirmation", with: "testing"
        click_button "Sign up"
      end
      expect(page).to have_selector(".alert", text: "Please fill in all required fields!")
    end
  end
end
