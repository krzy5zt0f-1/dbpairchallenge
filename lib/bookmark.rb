require 'pg'
require 'uri'
require_relative 'connection'

class Bookmark

  def self.all

    table  = DatabaseConnection.query('SELECT * FROM bookmarks;') # within database, connecting to table
    table.map { |result| [result['url'], result['title'], result['id']]}
  end

  def self.add(url, title)
     DatabaseConnection.query("INSERT INTO bookmarks (url, title) VALUES('#{url}', '#{title}')")
  end

  def self.remove(id)
    DatabaseConnection.query("DELETE FROM bookmarks WHERE id='#{id}'")
  end

  def self.update(url, title, id)
    DatabaseConnection.query("UPDATE bookmarks SET url='#{url}', title='#{title}' WHERE id='#{id}'")
  end

  def self.validate(url)
    url =~ /\A#{URI::regexp(['http', 'https'])}\z/
  end
end
