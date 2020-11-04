require_relative 'connection'
if ENV['RACK_ENV'] == 'test'
  DatabaseConnection.setup('bookmark_manager_test') # connecting to database
else
  DatabaseConnection.setup('bookmark_manager') # connecting to database
end
