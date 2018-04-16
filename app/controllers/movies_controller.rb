class MoviesController < ApplicationController
  attr_reader :movie

  def index
    @playing_movies = Movie.playing
    @coming_movies = Movie.coming
  end

  def show
    @movie = Movie.find_by id: params[:id]
    return if movie
    flash[:error] = t ".movie_not_found"
    redirect_to root_path
  end
end
