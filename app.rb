require 'sinatra/base'
require './lib/bookmark'
require './lib/setup'
require 'sinatra/flash'

class BookmarkManager < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  ['/bookmarks', '/update', '/update_post', '/updated'].each do |path|
    before path do
    @bookmarks = Bookmark.all
    end
  end

  get '/hello' do
    "Hello World!"
  end

  get '/' do
    redirect '/bookmarks'
  end

  get '/bookmarks' do
    erb(:index)
  end

  post '/add' do
    Bookmark.add(params[:url], params[:title])
    redirect '/bookmarks'
  end

  post '/delete' do
    Bookmark.remove(params[:link_to_delete])
    redirect '/bookmarks'
  end

  get '/update' do
    erb(:edit)
  end

  get '/update_post' do
    @data = params[:link_to_update]
     erb(:edit_post)
  end

  post '/updated' do
    Bookmark.update(params[:url], params[:title], params[:id])
    redirect '/update'
  end

run! if app_file == $0
end
