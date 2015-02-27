require 'rails_helper'

feature "edit an existing listing" do
  before do
    @listing = create(:listing)
    sign_in_with @listing.user
  end
  
  scenario "update description" do
    visit users_path
    expect(page).to have_content(@listing.description)
    click_link 'Edit me'
    fill_in 'Description', with: 'Feature test description'
    click_button 'Update Listing'
    expect(page).to have_content('Feature test description') 
  end
end