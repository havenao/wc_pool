class Share < ApplicationRecord
  belongs_to :player
  belongs_to :team

  def self.get_percentage(team_id, player_id)
    decimal = calculate_value(team_id, player_id)
    decimal * 100
  end

  def self.calculate_value(team_id, player_id)
    shares = Share.where(team_id: team_id)
    total_shares = 0
    
    shares.each do |share|      
      total_shares += share.shares
    end

    player_share = Share.where(player_id: player_id, team_id: team_id).take.shares
    player_share.to_f / total_shares.to_f
  end

  def self.get_points(team_id, player_id)
    team = Team.find(team_id)
    team.points * calculate_value(team_id, player_id)
  end

  def get_team_name(id)
    Team.find(id).name
  end
end
