class Player < ApplicationRecord
  belongs_to :user
  has_many :shares
  has_many :teams, through: :shares

  validates :name, presence: true, uniqueness: true

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

  def spend_credits(amount)
    raise StandardError, "Not enough Credits!" if credits < amount.to_i
    update(credits: credits - amount.to_i)
  end
end
