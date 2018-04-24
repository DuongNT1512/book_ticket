class PaymentsController < ApplicationController
  def create
    order = Order.find_by id: params[:order_id]
    order.succeeded!
    order.send_email :purchased, current_user
    render json: {status: "success", message: t(".paid")}
  end
end
