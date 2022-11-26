class Player < ApplicationRecord
  has_many :shares
  has_many :teams, through: :shares

  def get_point_total
    point_total = 0

    shares.each do |share|
      point_total += share.points || 0
    end

    point_total.to_f
  end

  def self.update_points
    players = Player.all

    players.each do |player|
      points = player.get_point_total
      player.update(:points => points)
    end
  end
end
