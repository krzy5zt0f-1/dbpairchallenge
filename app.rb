require 'sinatra/base'

class BookmarkManager < Sinatra::Base

  get '/hello' do
    "Hello World!"
  end

run! if app_file == $0
end
