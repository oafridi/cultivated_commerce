require 'rails_helper'

feature "edit an existing listing" do
  before do
    @user = create(:user)
    item = build(:item)
    @listing = build(:listing)
    item.listings << @listing
    @listing.save
    @user.listings << @listing
    sign_in_with @user
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