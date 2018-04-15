module ApplicationHelper
  def bootstrap_class_for flash_type
    {
      success: "alert-success",
      error: "alert-error",
      alert: "alert-danger",
      notice: "alert-info"
    }[flash_type.to_sym] || flash_type.to_s
  end

  def bootstrap_glyphs_icon flash_type
    {
      success: "glyphicon-ok",
      error: "glyphicon-exclamation-sign",
      alert: "glyphicon-warning-sign",
      notice: "glyphicon-info-sign"
    }[flash_type.to_sym] || "glyphicon-screenshot"
  end

  def gender_selections
    User.genders.keys.inject([]) do |array, item|
      array << [t(item), item.to_sym]
    end
  end

  def more_than? movies_count
    return true if @movies.count > movies_count
    false
  end

  def first_n_movies movies_count
    return @movies[0, movies_count] if more_than? movies_count
    @movies
  end
end
