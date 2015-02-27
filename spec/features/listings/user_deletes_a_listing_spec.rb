require 'rails_helper'

feature "delete a listing" do
  before do    
    @listing = create(:listing)    
    sign_in_with @listing.user
  end
  
  scenario "as logged in user" do
    visit users_path
    expect(page).to have_content(@listing.description)
    click_link 'Delete'
    expect(page).not_to have_content(@listing.description)    
  end
end