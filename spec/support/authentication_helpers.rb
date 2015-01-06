module AuthenticationHelpers

  def sign_in_with(user)
    visit root_path
    click_link 'Login'
    find('#js-email-login').set(user.email)
    fill_in 'user_password', with: user.password
    click_button 'Login'
  end

  def sign_up_with(user)
    visit root_path
    click_link 'Sign up'      

    fill_in 'user_first_name', with: user.first_name
    fill_in 'user_last_name', with: user.last_name
    find('#js-email-signup').set(user.email)
    fill_in 'user_address_line_1', with: user.address_line_1
    fill_in 'user_city', with: user.city
    fill_in 'user_zipcode', with: user.zipcode
    find('#js-password-signup').set(user.password)
    find('#js-password-confirmation-signup').set(user.password)
    click_button 'Sign up'
  end
end