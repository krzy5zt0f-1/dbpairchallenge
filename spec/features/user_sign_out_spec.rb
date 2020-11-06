feature "destory a user session" do
  scenario "sign out" do
    User.add("examplar_email", "password")
    visit ('/')
    click_button('Sign in!')
    fill_in('email', with: 'examplar_email')
    fill_in('password', with: 'password')
    click_button('Login')
    click_button('Sign out')
    expect(page).to have_content('Are you an existing user?')
    expect(page).not_to have_content('Welcome, examplar_email')
  end
end
