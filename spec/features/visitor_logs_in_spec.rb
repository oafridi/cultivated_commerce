require 'rails_helper'

feature "Visitor logs in" do
  scenario "as a registered user" do
    user = create(:user)
    sign_in_with user
    expect(page).not_to have_content("Sign in")
    expect(page).not_to have_content("Sign up")
    expect(page).to have_content(user.first_name)
    expect(page).to have_content("logout")
  end

  scenario "as an unregistered user" do
    user = build(:user)
    sign_in_with user
    expect(page).to have_content("Invalid email or password")
    expect(page).to have_content("Sign up")
  end  

end