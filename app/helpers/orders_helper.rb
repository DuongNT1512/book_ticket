module OrdersHelper
  def hidden_seat? row, column
    return unless @layout[row - 1][column - 1].zero?
    true
  end

  def reserved_seat? row, column
    reserved_seats = @movie_show.tickets.available.map(&:seat_code)
    return unless reserved_seats.include? "#{row}:#{column}"
    true
  end

  def show_start_time
    l @movie_show.start_time, format: :order_new_format
  end

  def movie_genres
    @movie.genres.map(&:name).join ", "
  end

  def theater_name
    @order.tickets.first.show.screen.theater.name
  end

  def screen_name
    @order.tickets.first.show.screen.name
  end

  def seats
    @order.tickets.map(&:seat_code).join ", "
  end

  def start_time
    @order.tickets.first.show.start_time.strftime Settings.order_datetime
  end

  def order_status
    return t(".reserved") if @order.reserved?
    return t(".cancelled") if @order.cancelled?
    return t(".succeeded") if @order.succeeded?
    t(".failed")
  end
end
