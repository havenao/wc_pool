class Team < ApplicationRecord
  has_many :shares
  has_many :players, through: :shares

  validates :name, presence: true
  validates :points, presence: true

  def get_point_total
    point_total = 0
    results = Result.where(team_id: id)

    results.each do |result|
      point_total += result.points
    end

    point_total.round(2)
  end
end
