class Ticket < ApplicationRecord
  belongs_to :show
  belongs_to :order

  validates :seat_code, presence: true
  validates :show, presence: true
  validates :order, presence: true

  scope :available, ->{where disabled: false}

  def disable
    self.disabled = true
    save
  end
end
