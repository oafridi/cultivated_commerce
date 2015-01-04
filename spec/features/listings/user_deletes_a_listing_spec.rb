require 'rails_helper'

feature "delete a listing" do
  before do
    @user = create(:user)
    item = build(:item)
    @listing = build(:listing)
    item.listings << @listing
    @listing.save
    @user.listings << @listing
    sign_in_with @user    
  end
  
  scenario "as logged in user" do
    visit users_path
    expect(page).to have_content(@listing.description)
    click_link 'Delete'
    expect(page).not_to have_content(@listing.description)    
  end
end