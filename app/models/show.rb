class Show < ApplicationRecord
  belongs_to :movie
  belongs_to :screen

  validates :date, presence: true
  validates :start, presence: true
  validates :end, presence: true
  validates :movie, presence: true
  validates :screen, presence: true

  scope :today, ->{where("start >= ?", Time.zone.now)}
end
