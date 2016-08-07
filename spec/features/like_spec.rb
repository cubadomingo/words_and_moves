RSpec.feature "Liking" do
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
      row.click_button("Like")
      expect(page).to have_selector(".alert", text: "Thank you for liking this Post")
    end
  end
  context "when user un-likes a post" do
    it "successfully unlikes a Post" do
      sign_in user
      visit feed_path
      row = find(".col-md-11")
      row.click_button("Like")
      row = find(".col-md-11")
      row.click_button("Un-like")
      expect(page).to have_selector(".alert", text: "You have unliked this Post")
    end
  end
end
