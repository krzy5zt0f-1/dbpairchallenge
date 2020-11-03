require 'pg'
require './lib/bookmark'

feature "Check the '/bookmarks' index path"  do
  scenario "go to '/bookmarks'" do
    visit('/bookmarks')
    expect(page).to have_current_path('/bookmarks')
  end
  scenario "go to '/bookmarks' and use text from index.erb" do
    Bookmark.add('http://www.makersacademy.com', 'title 1')
    Bookmark.add('http://www.destroyallsoftware.com', 'title 2')
    Bookmark.add('http://www.google.com', 'title 3')

    visit('/bookmarks')

    expect(page).to have_content("title 1")
    expect(page).to have_content("title 2")
    expect(page).to have_content("title 3")

  end
end
