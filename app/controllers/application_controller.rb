class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  configure do
    set :views, "app/views"
  end

  get '/movies/new' do
    erb :"/movies/new"
  end
end
