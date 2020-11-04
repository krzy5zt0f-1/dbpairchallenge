feature 'removing bookmark' do
    scenario 'adding and then removing new bookmark from bookmark manager' do
        visit('/bookmarks')
        fill_in('url', with: "http://google.com")
        fill_in('title', with: "evil search")
        click_button('Add')
        click_button('x')
        expect(page).not_to have_content "evil search"
    end
end
