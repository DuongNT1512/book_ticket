class MovieGenre < ApplicationRecord
  belongs_to :movie
  belongs_to :genre

  validates :movie, presence: true
  validates :genre, presence: true
end
