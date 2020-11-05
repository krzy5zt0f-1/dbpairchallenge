feature 'adding an invalid link to bookmark manager' do
    scenario 'expecting error message' do
        visit('/bookmarks')
        fill_in('url', with: "invalid stuff")
        fill_in('title', with: "random title")
        click_button('Add')
        expect(page).to have_content "submit a valid URL."
    end
end
