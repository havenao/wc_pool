class Team < ApplicationRecord
  validates :name, presence: true
  validates :points, presence: true
end
