class HomePagesController < ApplicationController
  before_action :airing_movies

  def index; end

  def contact; end

  def help; end

  def about; end

  private

  def airing_movies
    @movies = Movie.joins(:shows).merge(Show.today).airing.latest_order
  end
end
