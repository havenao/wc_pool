class Team < ApplicationRecord
  has_many :shares
  has_many :players, through: :shares

  validates :name, presence: true
  validates :points, presence: true
end
