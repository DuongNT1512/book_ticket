class Order < ApplicationRecord
  enum status: Settings.order.status

  has_many :tickets, dependent: :destroy

  validates :amount, presence: true, numericality: true
  validates :status, presence: true, inclusion: {in: status.keys}
end
