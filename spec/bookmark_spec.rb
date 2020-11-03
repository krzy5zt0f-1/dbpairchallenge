require_relative '../lib/bookmark'

describe Bookmark do
  subject { described_class }
  it {is_expected.to respond_to(:all)}

  describe '.all' do
    it 'returns all bookmarks' do
      connection = PG.connect(dbname: 'bookmark_manager_test')
      connection.exec("INSERT INTO bookmarks (url, title) VALUES ('http://www.makersacademy.com', 'makers');")
      bookmarks = Bookmark.all

      expect(bookmarks).to include(["http://www.makersacademy.com", "makers"])

    end
  end

  describe '#add' do
    it 'adds a bookmark' do
      subject.add('Swizel was here', 'with a title')
      expect(subject.all).to include ['Swizel was here', 'with a title']
    end
  end
  describe '#remove' do
    it 'removes a bookmark' do
      subject.add('Swizel was here', 'with a title')
      expect(subject.all).to include ['Swizel was here', 'with a title'] #can be removed lag
      subject.remove('with a title')
      expect(subject.all).not_to include ['Swizel was here', 'with a title']
    end
  end

end
