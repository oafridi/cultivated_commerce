require 'rails_helper'

feature 'Visitor signs up' do
  let(:user) { build(:user) }

  scenario 'with valid email and password' do
    sign_up_with(user)    
    expect(page).not_to have_content('Sign in')
    expect(page).to have_content('logout')
    expect(page).to have_content('logout')
  end

  scenario 'with blank email' do
    user.email = ''
    sign_up_with(user)
    expect(page).to have_content("Email can't be blank")
  end

  scenario 'with invalid email' do
    user.email = 'oooo@oooo'
    sign_up_with(user)
    expect(page).to have_content('Email is invalid')
  end

  scenario 'with blank password' do
    user.password = ''
    sign_up_with(user)
    expect(page).to have_content("Password can't be blank") 
  end

  scenario 'with invalid password' do
    user.password = '1234'
    sign_up_with(user)
    expect(page).to have_content('Password is too short (minimum is 8 characters)')
  end

end