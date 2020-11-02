require 'pg'
class Bookmark

  def self.all
    conn = PG.connect(:dbname => 'bookmark_manager') # connecting to database
    table  = conn.exec('SELECT * FROM bookmarks;') # within database, connecting to table
    table.map { |result| result['url']}
  end
end
