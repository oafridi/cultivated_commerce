require 'rails_helper'

feature "create a listing" do
  before do
    @user = create(:user)
    sign_in_with @user    
    create(:item)
    @listing = attributes_for(:listing)
    p @listing
  end
  
  scenario "with valid arguments", js: true do
    visit users_path
    expect(page).not_to have_content(@listing[:description])
    click_link 'Add another item'
    fill_in 'Title', with: @listing[:title]
    fill_in 'Description', with: @listing[:description]
    fill_in 'Quantity', with: @listing[:quantity]
    click_button 'Create Listing'
    expect(page).to have_content(@listing[:description])
  end
end