class Order < ApplicationRecord
  enum status: Settings.order.status

  has_many :tickets, dependent: :destroy
  belongs_to :user

  validates :amount, presence: true, numericality: true
  validates :status, presence: true, inclusion: {in: statuses.keys}

  def send_email attr, user
    OrderMailer.send_notification_mail(attr, self, user).deliver_now
  end

  def cancel
    cancelled!
    tickets.map(&:disable)
  end
end
