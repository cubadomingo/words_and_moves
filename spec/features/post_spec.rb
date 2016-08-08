RSpec.feature "Post" do
  let(:region) { FactoryGirl.create :region }
  let(:post) { FactoryGirl.create(:post, region: region, title: "Test Post", body: "Test Post Body") }
  let(:user) { FactoryGirl.create :user }

  scenario "Create Post" do
    category = FactoryGirl.create(:category, name: "Comedy")
    count = Post.count
    sign_in user
    visit new_region_post_path(region.slug)
    fill_in "post[title]", with: "Kevin Hart (Stand-up Profile)"
    fill_in "post[body]", with: "Kevin Hart takes the stage in Washington DC to put on his most anticipated stand up to date"
    select "Comedy", from: "post[category_id]"
    click_button "Create Post"
    expect(page).to have_selector(".alert", text: "Thank you for creating a post")
    expect(Post.count).to be > count
    expect(page).to have_selector(".post", text: "Kevin Hart (Stand-up Profile)")
  end
  scenario "View Post" do
    sign_in user
    visit region_post_path(region.slug, post.slug)
    expect(page).to have_selector("h1", text: "Test Post")
    expect(page).to have_selector("p", text: "Test Post Body")
  end
end