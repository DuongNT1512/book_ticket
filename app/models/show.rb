class Show < ApplicationRecord
  belongs_to :movie
  belongs_to :screen
  has_many :tickets, dependent: :destroy

  validates :ticket_price, presence: true, numericality: true
  validates :date, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :movie, presence: true
  validates :screen, presence: true
  validate :end_time_not_before_start_time

  scope :today, ->{where("start_time >= ?", Time.zone.now)}
  scope :most_immediate, ->{order :start_time}
  scope :by_theater, (lambda do |theater|
    joins(:screen).where("screens.theater_id = ?", theater.id)
  end)

  def response_ajax
    {id: id, start_time: start_time.strftime(Settings.time_format)}
  end

  def prettified_date
    date.strftime Settings.date_format
  end

  private

  def end_time_not_before_start_time
    errors.add :end_time, t(".not_before_start") if end_time < start_time
  end
end
