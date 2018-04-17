class PaymentsController < ApplicationController
  def create
    order = Order.find_by id: params[:order_id]
    order.succeeded!
    order.send_purchased_email current_user
    render json: {status: "success", message: t(".paid")}
  end
end
