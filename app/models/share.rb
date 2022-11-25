class Share < ApplicationRecord
  belongs_to :player
  belongs_to :team

  def team_shares
    Share.where(team_id: team_id)
  end

  def team_total
    shares = team_shares
    total_shares = 0

    shares.each do |share|      
      total_shares += share.amount
    end

    total_shares
  end

  def player_stake
    amount.to_f / team_total.to_f
  end
  
  def player_stake_percent
    player_stake * 100
  end

  def player_points
    team.points * player_stake
  end


  def self.update_points
    shares = Share.all

    shares.each do |share|
      points = share.player_points
      share.update(:points => points)
    end
  end
end
