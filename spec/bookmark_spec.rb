require_relative '../lib/bookmark'

describe Bookmark do
  subject { described_class }
  it {is_expected.to respond_to(:all)}

  describe '.all' do
    it 'returns all bookmarks' do
      bookmarks = Bookmark.all

      expect(bookmarks).to include("http://www.makersacademy.com")
      expect(bookmarks).to include("http://www.destroyallsoftware.com")
      expect(bookmarks).to include("http://www.google.com")
    end
  end 
end
