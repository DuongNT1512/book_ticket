class OrdersController < ApplicationController
  attr_reader :movie_show

  before_action :check_show_param, only: :new

  def new
    @movie_show = Show.find_by id: params[:show_id]
    @layout = JSON.parse movie_show.screen.layout
    @reserved_seats = movie_show.tickets.map(&:seat_code)
  end

  def create; end

  private

  def check_show_param
    render "shows/index" if params[:show_id].blank?
  end
end
