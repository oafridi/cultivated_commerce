require 'rails_helper'
include Warden::Test::Helpers
Warden.test_mode!

feature "delete a listing" do
  before do
    @user = create(:user)
    @listing = create(:listing)
    @user.listings << @listing
    sign_in_with @user    
  end
  
  scenario "" do
    visit users_path
    expect(page).to have_content(@listing.description)
  end
end