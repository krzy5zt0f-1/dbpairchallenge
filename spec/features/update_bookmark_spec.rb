feature 'adding and updating bookmark' do
    scenario 'adding and then updating new bookmark in a bookmark manager' do
        visit('/bookmarks')
        fill_in('url', with: "http://google.com")
        fill_in('title', with: "evil search")
        click_button('Add')
        click_button('Edit mode')
        click_button('edit')
        fill_in('title', with: "google")
        click_button('Edit')
        click_button('Done!')
        expect(page).to have_content "google"
    end
end
