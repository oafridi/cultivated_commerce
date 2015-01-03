require 'rails_helper'

feature "Visitor logs out" do
  scenario "when logged in" do
    user = create(:user)
    sign_in_with user
    click_link "logout"
    expect(page).not_to have_content("logout")    
    expect(page).to have_content("Login") 
  end  
end