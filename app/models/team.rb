class Team < ApplicationRecord
  has_many :shares
  has_many :players, through: :shares

  validates :name, presence: true

  def get_point_total
    point_total = 0
    results = Result.where(team_id: self.id)

    results.each do |result|
      point_total += result.points
    end

    point_total
  end

  def update_points
    points = get_point_total
    self.update(:points => points)
  end
end
