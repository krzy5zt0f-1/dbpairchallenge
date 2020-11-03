feature 'adding bookmark' do 
    scenario 'adding a new bookmark to bookmark manager' do
        visit('/bookmarks')
        fill_in('url', with: "http://google.com")
        click_button('Add')
        expect(page).to have_content "http://google.com"
    end 
end 
