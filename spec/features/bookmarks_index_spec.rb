require 'pg'

feature "Check the '/bookmarks' index path"  do
  scenario "go to '/bookmarks'" do
    visit('/bookmarks')
    expect(page).to have_current_path('/bookmarks')
  end

  scenario "go to '/bookmarks' and use text from index.erb" do
    connection = PG.connect(dbname: 'bookmark_manager_test')

    connection.exec("INSERT INTO bookmarks VALUES(1, 'http://www.makersacademy.com');")
    connection.exec("INSERT INTO bookmarks VALUES(2, 'http://www.destroyallsoftware.com');")
    connection.exec("INSERT INTO bookmarks VALUES(3, 'http://www.google.com');")

    visit('/bookmarks')

    expect(page).to have_content("http://www.makersacademy.com")
    expect(page).to have_content("http://www.destroyallsoftware.com")
    expect(page).to have_content("http://www.google.com")

  end
end
