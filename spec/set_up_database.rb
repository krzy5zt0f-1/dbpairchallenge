require 'pg'

def set_up
p "Setting up database for testing"

connection = PG.connect(dbname: 'bookmark_manager_test')

# Clearing the test bookmarks
connection.exec("TRUNCATE bookmarks;")
end 
