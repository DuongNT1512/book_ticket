class ShowsController < ApplicationController
  attr_reader :movie, :theater

  before_action :check_movie, :check_theater, only: :index, if: :ajax_request?

  def index
    index_by_movie_theater if ajax_request?
  end

  private

  def check_movie
    @movie = Movie.find_by id: params[:movie_id]
    return render_error :movie unless movie.present? && movie.playing?
  end

  def check_theater
    @theater = Theater.find_by id: params[:theater_id]
    return render_error :theater if theater.blank?
  end

  def index_by_movie_theater
    shows = movie.shows.by_theater(theater).today.most_immediate
    dates = shows.map(&:prettified_date).uniq
    render json: {status: true, response: shows_by_date(shows, dates).to_a}
  end

  def shows_by_date shows, dates
    date_hash = dates.inject({}){|hash, date| hash.merge(date => [])}
    shows.each{|show| date_hash[show.prettified_date] << show.response_ajax}
    date_hash
  end

  def render_error attr
    translation = ".#{attr}_not_found"
    render json: {status: false, message: t(translation)}
  end

  def ajax_request?
    return true if params[:movie_id].present? && params[:theater_id].present?
    false
  end
end
