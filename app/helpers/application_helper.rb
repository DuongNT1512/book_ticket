module ApplicationHelper
  def more_than? movies_count
    return true if @movies.count > movies_count
    false
  end

  def first_n_movies movies_count
    return @movies[0, movies_count] if more_than? movies_count
    @movies
  end
end
