feature "creatign a new session" do
  scenario "singing in as an existing user, succsefull" do
    User.add('examplar_email', 'password1234')
    visit ('/')
    click_button('Sign in!')
    fill_in('email', with: 'examplar_email')
    fill_in('password', with: 'password1234')
    click_button('Login')
    expect(page).to have_content("Welcome, examplar_email")
  end

  scenario "singing in as non-existent user, unsuccsesfull" do
    visit ('/')
    click_button('Sign in!')
    fill_in('email', with: 'examplar_email')
    fill_in('password', with: 'password1234')
    click_button('Login')
    expect(page).not_to have_content("Welcome, examplar_email")
    expect(page).to have_content("Please check your email or password.")
  end

  scenario "singing in as an existing user,but with inccorect password, unsuccsesfull" do
    User.add('examplar_email', 'password1234')
    visit ('/')
    click_button('Sign in!')
    fill_in('email', with: 'examplar_email')
    fill_in('password', with: 'password')
    click_button('Login')
    expect(page).not_to have_content("Welcome, examplar_email")
    expect(page).to have_content("Please check your email or password.")
  end
end
