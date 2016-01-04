class MoodController < ApplicationController
  get '/moods/new' do
    erb :"moods/new"
  end

  post '/moods' do
    @mood = Mood.find_or_create_by(params[:mood])
    if !params[:movie][:name].empty?
      @mood.movies << Movie.create(params[:movie])
    end
    erb :"moods/show"
  end

  get '/moods' do
    @moods = Mood.all
    erb :"moods/index"
  end

  # get '/moods/:slug' do
  # end
end
