require 'sinatra/base'
require './lib/bookmark'

class BookmarkManager < Sinatra::Base

  get '/hello' do
    "Hello World!"
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb(:index)
  end

  post '/add' do
    Bookmark.add(params[:url], params[:title])
    redirect '/bookmarks'
  end

run! if app_file == $0
end
