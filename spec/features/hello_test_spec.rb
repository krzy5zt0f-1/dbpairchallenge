feature 'Check the /hello path' do
  scenario "go to '/hello' and have the 'Hello World!' displayed" do
    visit('/hello')
    expect(page).to have_content("Hello World!")
  end
end
