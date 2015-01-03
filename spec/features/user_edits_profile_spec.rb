require 'rails_helper'

feature "User edits profile" do
  scenario "when logged in", js: true do
    user = create(:user)
    sign_in_with user    
    visit user_path
    click_link 'Edit profile'
    # save_and_open_page
    expect(page).to have_content(user.last_name)
  end
end