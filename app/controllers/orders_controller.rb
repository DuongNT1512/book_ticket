class OrdersController < ApplicationController
  attr_reader :movie_show, :order, :seats

  before_action :check_show_param, only: :new
  before_action :authenticate_user!, only: %i(create show)
  before_action :find_movie_show, only: %i(new create)
  before_action :find_order, only: %i(show destroy)

  def new
    @layout = JSON.parse movie_show.screen.layout
  end

  def create
    @order = Order.new amount: order_price, status: :reserved,
      user: current_user
    return render json: {status: "failed"} unless order.save
    save_order_successful
  end

  def show
    @movie = order.tickets.first.show.movie
  end

  def destroy
    order.cancel
    order.send_email :cancelled, current_user
    flash[:success] = t ".cancelled"
    redirect_to order_path(order)
  end

  private

  def check_show_param
    render "shows/index" if params[:show_id].blank?
  end

  def order_price
    params[:seats].count * movie_show.ticket_price
  end

  def save_order_successful
    params[:seats].each do |code|
      Ticket.create! seat_code: code, show: movie_show, order: order
    end
    flash[:success] = t ".reserved"
    order.send_email :reserved, current_user
    render json: {status: "success", order: order.id}
  end

  def find_movie_show
    @movie_show = Show.find_by id: params[:show_id]
    return if movie_show
    flash[:error] = t ".show_not_found"
    redirect_to root_path
  end

  def find_order
    @order = Order.find_by id: params[:id]
    return if order
    flash[:error] = t ".order_not_found"
    redirect_to root_path
  end
end
