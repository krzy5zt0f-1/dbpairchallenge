require_relative '../lib/bookmark'

describe Bookmark do
  subject { described_class }
  it {is_expected.to respond_to(:all)}

  describe '.all' do
    it 'returns all bookmarks' do
      connection = PG.connect(dbname: 'bookmark_manager_test')
      connection.exec("INSERT INTO bookmarks (url, title, id) VALUES ('http://www.makersacademy.com', 'makers', 1);")
      bookmarks = Bookmark.all
      expect(bookmarks).to include(["http://www.makersacademy.com", "makers", "1"])
    end
  end

  describe '#add' do
    it 'adds a bookmark' do
      subject.add('Swizel was here', 'with a title')
      connection = PG.connect(dbname: 'bookmark_manager_test')
      connection.exec("UPDATE bookmarks SET id=2 WHERE url='Swizel was here';")
      bookmarks = Bookmark.all
      expect(subject.all).to include ['Swizel was here', 'with a title', '2']
    end
  end

  describe '#remove' do
    it 'removes a bookmark' do
      subject.add('Swizel was here', 'with a title')
      connection = PG.connect(dbname: 'bookmark_manager_test')
      connection.exec("UPDATE bookmarks SET id=2 WHERE url='Swizel was here';")
      bookmarks = Bookmark.all
      subject.remove(2)
      expect(subject.all).not_to include ['Swizel was here', 'with a title', '2']
    end
  end

  describe '#update' do
    it 'updates a bookmark' do
      subject.add('Swizel was here', 'with a title')
      connection = PG.connect(dbname: 'bookmark_manager_test')
      connection.exec("UPDATE bookmarks SET id=2 WHERE url='Swizel was here';")
      bookmarks = Bookmark.all
      subject.update('Shes no more', 'title changed', 2)
      expect(subject.all).to include ['Shes no more', 'title changed', '2']
    end
  end
end
