require 'pg'
class Bookmark

  def self.all

    table  = connetion_choice.exec('SELECT * FROM bookmarks;') # within database, connecting to table
    table.map { |result| [result['url'], result['title'], result['id']]}
  end

  def self.add(url, title)
    connetion_choice.exec("INSERT INTO bookmarks (url, title) VALUES('#{url}', '#{title}')")
  end

  def self.remove(id)
    connetion_choice.exec("DELETE FROM bookmarks WHERE id='#{id}'")
  end

  def self.update(url, title, id)
    connetion_choice.exec("UPDATE bookmarks SET url='#{url}', title='#{title}' WHERE id='#{id}'")
  end

  private
  def self.connetion_choice
    if ENV['RACK_ENV'] == 'test'
      PG.connect(:dbname => 'bookmark_manager_test') # connecting to database
    else
      PG.connect(:dbname => 'bookmark_manager') # connecting to database
    end
  end
end
