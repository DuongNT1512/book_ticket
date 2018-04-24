module OrdersHelper
  def hidden_seat? row, column
    return unless @layout[row - 1][column - 1].zero?
    true
  end

  def reserved_seat? row, column
    return unless @reserved_seats.include? "#{row}:#{column}"
    true
  end

  def show_start_time
    l @movie_show.start_time, format: :order_new_format
  end
end
