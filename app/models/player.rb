class Player < ApplicationRecord
  has_many :shares
  has_many :teams, through: :shares

  def get_point_total
    point_total = 0

    teams.each do |team|
      point_total += (team.points.to_f * Share.calculate_value(team.id, id))
    end

    point_total.round(2)
  end
end
