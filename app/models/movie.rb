class Movie < ApplicationRecord
  enum language: Settings.movie.languages
  enum status: Settings.movie.status
  enum rate: Settings.movie.rates

  has_many :movie_genres, dependent: :destroy
  has_many :genres, through: :movie_genres
  has_many :shows, dependent: :destroy

  validates :name, presence: true, length: {maximum: Settings.movie.max_name}
  validates :length, presence: true,
    numericality: {only_integer: true, greater_than_or_equal_to:
                   Settings.movie.min_length, less_than_or_equal_to:
                   Settings.movie.max_length}
  validates :language, presence: true, inclusion: {in: languages.keys}
  validates :description, length: {maximum: Settings.movie.max_desc}
  validates :status, presence: true, inclusion: {in: statuses.keys}
  validates :rate, presence: true, inclusion: {in: rates.keys}
end
