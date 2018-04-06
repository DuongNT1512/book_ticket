class Screen < ApplicationRecord
  belongs_to :theater
  has_many :shows, dependent: :destroy

  validates :name, presence: true, length: {maximum: Settings.screen.max_name}
  validates :description, length: {maximum: Settings.screen.max_desc}
  validates :seat, presence: true,
    numericality: {only_integer: true, greater_than_or_equal_to:
                   Settings.screen.min_seat, less_than_or_equal_to:
                   Settings.screen.max_seat}
  validates :theater, presence: true
end
