class MovieController < ApplicationController

  get '/movies/new' do
    erb :"/movies/new"
  end

  post '/movies' do
    @movie = Movie.create(params[:movie])
    @mood = Mood.find_or_create_by(params[:mood])
    @movie.mood = @mood

    if !@movie.save || !@mood.save
      @errors_movie = @movie.errors.messages
      @errors_mood = @mood.errors.messages
      erb :"movies/failure"
    else
      redirect '/movies'
    end
  end

  get '/movies' do
    @movies = Movie.order(:effect_rating).reverse
    erb :"movies/index"
  end

  get '/movies/:slug/edit' do
    @movie = Movie.find_by_slug(params[:slug])
    erb :"movies/edit"
  end

  post '/movies/:slug' do
    @movie = Movie.find_by_slug(params[:slug])
    @mood = Mood.find_or_create_by(params[:mood])
    params[:movie][:mood_id] = @mood.id
    @movie.update(params[:movie])
    erb :"movies/show"
  end

  get '/movies/:slug' do
    @movie = Movie.find_by_slug(params[:slug])
    @mood = Mood.find_or_create_by(params[:mood])
    erb :"movies/show"
  end

  get '/movies/:slug/delete' do
    @movie = Movie.find_by_slug(params[:slug])
    erb :"movies/delete"
 end

  post '/movies/:slug/delete' do
     @movie = Movie.find_by_slug(params[:slug])
    @movie.destroy
    redirect '/movies'
      end

end
