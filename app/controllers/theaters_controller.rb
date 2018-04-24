class TheatersController < ApplicationController
  attr_reader :movie

  before_action :check_movie, only: :index, if: :ajax_request?

  def index
    index_by_movie if ajax_request?
  end

  private

  def check_movie
    @movie = Movie.find_by id: params[:movie_id]
    return render_error unless movie.present? && movie.playing?
  end

  def index_by_movie
    theaters = Theater.by_movie(movie).uniq
    data = theaters.map(&:response_ajax)
    render json: {status: true, response: data}
  end

  def render_error
    render json: {status: false, message: t(".movie_not_found")}
  end

  def ajax_request?
    return true if params[:movie_id].present?
    false
  end
end
