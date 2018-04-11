class Theater < ApplicationRecord
  has_many :screens, dependent: :destroy

  validates :name, presence: true, length: {maximum: Settings.theater.max_name}
  validates :description, length: {maximum: Settings.theater.max_desc}
  validates :address, presence: true
end
