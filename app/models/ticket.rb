class Ticket < ApplicationRecord
  belongs_to :show
  belongs_to :order

  validates :seat_code, presence: true
  validates :price, presence: true, numericality: true
  validates :show, presence: true
  validates :order, presence: true
end
