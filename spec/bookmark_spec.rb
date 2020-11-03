require_relative '../lib/bookmark'

describe Bookmark do
  subject { described_class }
  it {is_expected.to respond_to(:all)}

  describe '.all' do
    it 'returns all bookmarks' do
      connection = PG.connect(dbname: 'bookmark_manager_test')
      connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.makersacademy.com');")
    connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.destroyallsoftware.com');")
    connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.google.com');")
      bookmarks = Bookmark.all

      expect(bookmarks).to include("http://www.makersacademy.com")
      expect(bookmarks).to include("http://www.destroyallsoftware.com")
      expect(bookmarks).to include("http://www.google.com")
    end
  end
  describe '#add' do 
    it 'adds a bookmark' do 
      subject.add('Swizel was here')
      expect(subject.all).to include 'Swizel was here'
    end 
  end 
end
