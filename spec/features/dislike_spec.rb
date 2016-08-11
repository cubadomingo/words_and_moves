RSpec.feature "Disliking" do
  let(:user) { FactoryGirl.create :user }
  let(:region) { FactoryGirl.create :region }
  let(:post) { FactoryGirl.create(:post, region: region) }
  before do
    post
    user.preferred_regions << region
    user.save
  end
  context "When user likes a post" do
    it "successfully likes Post" do
      sign_in user
      visit feed_path
      click_on ("dislike")
      expect(page).to have_selector(".glyph-active")
    end
  end
  context "when user un-likes a post" do
    it "successfully unlikes a Post" do
      sign_in user
      visit feed_path
      click_on ("dislike")
      expect(page).to have_selector(".glyph-active")
      click_on ("undislike")
      expect(page).to have_no_selector(".glyph-active")
    end
  end
end
