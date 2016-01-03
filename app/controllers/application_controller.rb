class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  configure do
    set :views, "app/views"
  end

  get '/movies/new' do
    erb :"/movies/new"
  end

  post '/movies' do
    @movie = Movie.create(params[:movie])
    @mood = Mood.create(params[:mood])
    @movie.mood = @mood

    if !@movie.save || !@mood.save
      @errors_movie = @movie.errors.messages
      @errors_mood = @mood.errors.messages
      erb :"movies/failure"
    else
      erb :"movies/show"
    end

  end

  get '/movies' do
    # binding.pry
    @movies = Movie.order(:effect_rating)
    erb :"movies/index"
  end


end
