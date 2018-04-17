class Order < ApplicationRecord
  enum status: Settings.order.status

  has_many :tickets, dependent: :destroy
  belongs_to :user

  validates :amount, presence: true, numericality: true
  validates :status, presence: true, inclusion: {in: statuses.keys}

  def send_reserved_email user
    OrderMailer.send_notification_mail(:reserved, self, user).deliver_now
  end

  def send_purchased_email user
    OrderMailer.send_notification_mail(:purchased, self, user).deliver_now
  end

  def send_cancelled_email user
    OrderMailer.send_notification_mail(:cancelled, self, user).deliver_now
  end

  def cancel
    cancelled!
    tickets.map(&:disable)
  end
end
