feature 'adding bookmark' do
    scenario 'adding a new bookmark to bookmark manager' do
        visit('/bookmarks')
        fill_in('url', with: "http://google.com")
        fill_in('title', with: "Swizels beloved GOOGLE")
        click_button('Add')
        expect(page).to have_content "Swizels beloved GOOGLE"
    end
end
