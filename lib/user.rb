require 'bcrypt'
require_relative 'connection'

class User
  attr_reader :id, :email

  def initialize(id, email)
    @id = id
    @email = email
  end

  def self.add(email, password)
    result = DatabaseConnection.query("INSERT INTO users (email, password) VALUES('#{email}', '#{BCrypt::Password.create(password)}') RETURNING id, email;")
    User.new(result[0]['id'], result[0]['email'])
  end

  def self.find(id)
    return nil unless id
    result = DatabaseConnection.query("SELECT email FROM users WHERE id='#{id}';")
    User.new(result[0]['id'], result[0]['email'])
  end

  def self.authenticate(email, password)
    result = DatabaseConnection.query("SELECT * FROM users WHERE email = '#{email}';")
    return nil unless result.any?
    return nil unless BCrypt::Password.new(result[0]['password']) == password
    User.new(result[0]['id'], result[0]['email'])
  end

end
