class Team < ApplicationRecord
  has_many :shares
  has_many :players, through: :shares

  validates :name, presence: true

  def points
    @points ||= Result.where(team_id: self.id).inject(0) { |total, result| total + result.points } || 0
  end
end
