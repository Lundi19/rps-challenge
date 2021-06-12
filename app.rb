require 'sinatra/base'
# require 'sinatra/reloader'

class RPS < Sinatra::Base
  
  configure :development do
    register Sinatra::Reloader
    
  end
  enable :sessions
  
  get '/' do
    erb :index
  end

  post '/name' do
    session[:name] = params[:name]
    redirect '/play'
  end

  get '/play' do
    @name = session[:name]
    @shape = session[:shape]
    erb :play
  end

  post '/play' do
    session[:shape] = params[:shape]
    redirect '/play'
  end

  run! if app_file == $0
end