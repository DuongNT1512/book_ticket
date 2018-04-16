class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable,
    :trackable, :validatable, :confirmable, :lockable

  enum gender: Settings.user.genders
  enum role: Settings.user.roles

  validates :first_name, presence: true,
    length: {maximum: Settings.user.max_first}
  validates :last_name, presence: true,
    length: {maximum: Settings.user.max_last}
  validates :gender, presence: true, inclusion: {in: genders.keys}
end
