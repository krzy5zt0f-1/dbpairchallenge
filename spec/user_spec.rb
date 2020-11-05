require_relative '../lib/user'

describe User do

  describe "#add" do
    it "creates new user" do
      user = User.add("example@email", "password")
      expect(user).to be_a User
      connection = PG.connect(dbname: 'bookmark_manager_test')
      id =connection.exec("SELECT id FROM users WHERE password='password';")
      expect(user.id).to eq id[0]['id']
      expect(user.email).to eq "example@email"
    end
  end
  describe "#find" do
    it "finds the user from database by it's id" do
      user = User.add("example@email", "password")
      expect(User.find(user.id).email).to eq "example@email"
    end 
  end

end
