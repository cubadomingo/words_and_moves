RSpec.feature "Commenting on post", js: true do
  let(:region) { FactoryGirl.create :region }
  let(:post) { FactoryGirl.create(:post, region: region, title: "Test Post", body: "Test Post Body") }
  let(:user) { FactoryGirl.create :user }

  context "Sunny Day" do 
    before do
      post.comments.create!(user_id: user.id, body: "test post")
      sign_in user
      visit region_post_path(region.slug, post.slug)
    end

    it "displays comments" do
      click_button "Show All"
      expect(page).to have_selector("h3", text: "Comments")
      expect(page).to have_selector(".row", text: "#{user.username}: test post")
    end
    context "when a user posts a comment" do
      it "displays alert" do
        click_button "Add Comment"
        fill_in "comment-text", with: "This is a new test comment"
        click_button "Post"
        expect(page).to have_selector(".alert-success", text: "Thanks!")
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
        visit region_post_path(region.slug, post.slug)
      end
      it "displays an error alert" do
        click_button "Add Comment"
        fill_in "comment-text", with: "This is a new test comment"
        click_button "Post"
        expect(page).to have_selector(".alert-danger h4", text: "Oh snap! Something went wrong!")
      end
    end
    context "when user doesn't fill comment body" do
      before do
        sign_in user
        visit region_post_path(region.slug, post.slug)
      end
      it "has a disabled submit button" do
        click_button "Add Comment"
        fill_in "comment-text", with: ""
        expect(page).to have_button('Post', disabled: true)
      end
    end
  end
end