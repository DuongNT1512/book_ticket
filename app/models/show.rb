class Show < ApplicationRecord
  belongs_to :movie
  belongs_to :screen

  validates :ticket_price, presence: true, numericality: true
  validates :date, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :movie, presence: true
  validates :screen, presence: true
  validate :end_time_not_before_start_time

  scope :today, ->{where("start_time >= ?", Time.zone.now)}

  private

  def end_time_not_before_start_time
    errors.add :end_time, "can't end before start" if end_time < start_time
  end
end
