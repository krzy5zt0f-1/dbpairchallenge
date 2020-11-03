require 'pg'
require './lib/bookmark'

feature "Check the '/bookmarks' index path"  do
  scenario "go to '/bookmarks'" do
    visit('/bookmarks')
    expect(page).to have_current_path('/bookmarks')
  end
  scenario "go to '/bookmarks' and use text from index.erb" do
    Bookmark.add('http://www.makersacademy.com')
    Bookmark.add('http://www.destroyallsoftware.com')
    Bookmark.add('http://www.google.com')
    
    visit('/bookmarks')

    expect(page).to have_content("http://www.makersacademy.com")
    expect(page).to have_content("http://www.destroyallsoftware.com")
    expect(page).to have_content("http://www.google.com")

  end
end
