require 'sinatra/base'
require './lib/bookmark'
require './lib/setup'
require 'sinatra/flash'
require './lib/user'


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
    redirect '/users/new'
  end

  get '/users/new' do
    erb(:users_new)
  end

  post '/users' do
    user = User.add(params[:email], params[:password])
    session[:user_id] = user.id
    redirect '/bookmarks'
  end


  get '/bookmarks' do
    @user = @user = User.find(session[:user_id])
    erb(:index)
  end

  post '/add' do
    Bookmark.validate(params[:url]) == 0 ? Bookmark.add(params[:url], params[:title]) : flash[:notice] = "submit a valid URL."
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
    Bookmark.update(params[:url], params[:title], params[:id], params[:comment])
    redirect '/update'
  end

run! if app_file == $0
end
