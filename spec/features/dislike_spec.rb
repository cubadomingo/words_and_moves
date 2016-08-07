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
      row = find(".col-md-11")
      row.click_button("Dislike")
      expect(page).to have_selector(".alert", text: "You have disliked this Post")
    end
  end
  context "when user un-likes a post" do
    it "successfully unlikes a Post" do
      sign_in user
      visit feed_path
      row = find(".col-md-11")
      row.click_button("Dislike")
      row = find(".col-md-11")
      row.click_button("Un-Dislike")
      expect(page).to have_selector(".alert", text: "You have un-disliked this Post")
    end
  end
end
