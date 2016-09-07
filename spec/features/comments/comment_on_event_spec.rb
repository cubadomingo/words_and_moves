RSpec.feature "Commenting on Event", js: true do
  let(:city) { FactoryGirl.create :city }
  let(:region) { city.subregion.region }
  let(:event) { FactoryGirl.create(:event, city: city, title: "Test Event", body: "Test Event Body", venue: "Verizon Center", date: Date.tomorrow, time: Time.now) }
  let(:user) { FactoryGirl.create :user }

  context "Sunny Day" do
    before do
      event.comments.create!(user_id: user.id, body: "test comment")
      sign_in user
      visit region_event_path(region.slug, event.slug)
    end

    it "displays comments" do
      click_button "Show All"
      expect(page).to have_selector("h3", text: "Comments")
      expect(page).to have_selector(".row", text: "#{user.username}: test comment")
    end
    context "when a user posts a comment" do
      it "displays alert" do
        click_button "Add Comment"
        fill_in "comment-text", with: "This is a new test comment"
        click_button "Post"
        expect(page).to have_text("Your comment has been successfully posted. Thanks!")
      end
      it "adds comment to list" do
        click_button "Add Comment"
        fill_in "comment-text", with: "This is a new test comment"
        click_button "Post"
        while page.has_selector?("button", text: "Show All")
          find("button", text: "Show All").click
        end
        expect(page).to have_selector(".row", text: "#{user.username}: This is a new test comment")
      end
    end
  end
  context "Rainy Day" do
    context "when user is not signed in" do
      before do
        visit region_event_path(region.slug, event.slug)
      end
      it "displays an error alert" do
        click_button "Add Comment"
        fill_in "comment-text", with: "This is a new test comment"
        click_button "Post"
        expect(page).to have_text("Sorry for the inconvenience. Feel free to retry your action, or contact us at admin@wordsandmoves.com.")
      end
    end
    context "when user doesn't fill comment body" do
      before do
        sign_in user
        visit region_event_path(region.slug, event.slug)
      end
      it "has a disabled submit button" do
        click_button "Add Comment"
        fill_in "comment-text", with: ""
        expect(page).to have_button('Post', disabled: true)
      end
    end
  end
end