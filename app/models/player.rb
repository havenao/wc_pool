class Player < ApplicationRecord
  has_many :shares
  has_many :teams, through: :shares

  def get_point_total
    point_total = 0

    teams.each do |team|
      point_total += ((team.points.to_f || 0) * Share.calculate_value(team.id, id))
    end

    point_total
  end

  def self.update_points
    players = Player.all

    players.each do |player|
      points = playerget_point_total
      player.update(:points => points)
    end
  end
end
