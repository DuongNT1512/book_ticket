class Theater < ApplicationRecord
  has_many :screens, dependent: :destroy

  validates :name, presence: true, length: {maximum: Settings.theater.max_name}
  validates :description, length: {maximum: Settings.theater.max_desc}
  validates :address, presence: true

  scope :by_movie, (lambda do |movie|
    joins(screens: :shows).where("shows.movie_id = ?", movie.id)
  end)

  def response_ajax
    {id: id, name: name}
  end
end
