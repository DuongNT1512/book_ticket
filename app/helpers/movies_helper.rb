module MoviesHelper
  def render_genres
    @movie.genres.map(&:name).join ", "
  end

  def render_release_date
    @movie.release_date.strftime("%d/%m/%Y")
  end
end
