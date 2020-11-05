require 'pg'
require 'uri'
require_relative 'connection'

class Bookmark

  def self.all

    table  = DatabaseConnection.query('SELECT * FROM bookmarks;') # within database, connecting to table
    table.map { |result| [result['url'], result['title'], result['id'], result['comment']]}
  end

  def self.add(url, title)
     DatabaseConnection.query("INSERT INTO bookmarks (url, title) VALUES('#{url}', '#{title}')")
  end

  def self.remove(id)
    DatabaseConnection.query("DELETE FROM bookmarks WHERE id='#{id}'")
  end

  def self.update(url, title, id, comment)
    DatabaseConnection.query("UPDATE bookmarks SET url='#{url}', title='#{title}', comment='#{comment}' WHERE id='#{id}'")
  end

  def self.validate(url)
    url =~ /\A#{URI::regexp(['http', 'https'])}\z/
  end

  def self.comment(comment, id)
    DatabaseConnection.query("UPDATE bookmarks SET comment='#{comment}' WHERE id='#{id}'")
  end
end
