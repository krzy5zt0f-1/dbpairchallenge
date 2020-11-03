require 'pg'
class Bookmark

  def self.all
    if ENV['RACK_ENV'] == 'test'
      conn = PG.connect(:dbname => 'bookmark_manager_test') # connecting to database
      table  = conn.exec('SELECT * FROM bookmarks;') # within database, connecting to table
    else
      conn = PG.connect(:dbname => 'bookmark_manager') # connecting to database
      table  = conn.exec('SELECT * FROM bookmarks;') # within database, connecting to table
    end
    table.map { |result| [result['url'], result['title']]}
  end

  def self.add(url, title)
    if ENV['RACK_ENV'] == 'test'
      conn = PG.connect(:dbname => 'bookmark_manager_test') # connecting to database
    else
      conn = PG.connect(:dbname => 'bookmark_manager') # connecting to database
    end
    conn.exec("INSERT INTO bookmarks (url, title) VALUES('#{url}', '#{title}')")
  end

  def self.remove(title)
    if ENV['RACK_ENV'] == 'test'
      conn = PG.connect(:dbname => 'bookmark_manager_test') # connecting to database
    else
      conn = PG.connect(:dbname => 'bookmark_manager') # connecting to database
    end
    conn.exec("DELETE FROM bookmarks WHERE title='#{title}'")
  end
end
