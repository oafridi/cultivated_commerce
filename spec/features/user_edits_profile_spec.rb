require 'rails_helper'

feature 'User edits profile' do
  before do
    @user = create(:user)
    @first_name = Faker::Name.first_name
    sign_in_with @user
  end

  scenario 'edits first name' do
    click_link @user.first_name
    expect(page).to have_content(@user.first_name) 
    click_link 'js-edit'
    fill_in 'First name', with: @first_name
    click_button 'Save changes'
    expect(page).to have_content(@first_name)
  end
end