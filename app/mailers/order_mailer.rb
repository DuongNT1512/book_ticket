class OrderMailer < ApplicationMailer
  attr_reader :user, :order

  def send_notification_mail attr, order, user
    @user = user
    @order = order
    send "order_#{attr}"
  end

  private

  def order_reserved
    mail to: user.email, subject: t(".subject"), template_name: "order_reserved"
  end

  def order_purchased
    mail to: user.email, subject: t(".subject"),
      template_name: "order_purchased"
  end

  def order_cancelled
    mail to: user.email, subject: t(".subject"),
      template_name: "order_cancelled"
  end
end
