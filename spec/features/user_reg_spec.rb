feature "testing user registration" do
  scenario "registering a new user" do
    visit ('/')
    fill_in('email', with: "example@gmail.com")
    fill_in('password', with: "password1234")
    click_button('Submit')
    expect(page).to have_content("Welcome, example@gmail.com")

  end

end
