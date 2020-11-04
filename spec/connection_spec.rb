require_relative '../lib/connection'

describe DatabaseConnection do
  subject { described_class }

  describe "#setup" do
    it "sets up a connection to a database" do
      expect(PG).to receive(:connect).with(dbname: 'bookmark_manager_test')
      subject.setup('bookmark_manager_test')
    end
  end

  describe ".conn" do
    it "is an instance of PG" do
      connection = subject.setup('bookmark_manager_test')
      expect(subject.conn).to eq connection
    end
  end

  describe "#query" do
    it "is queries what's been asked for" do
      subject.setup('bookmark_manager_test')
      expect(subject.conn).to receive(:exec).with('SELECT * FROM bookmarks;')
      subject.query('SELECT * FROM bookmarks;')
    end
  end

end
