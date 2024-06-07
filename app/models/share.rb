class Share < ApplicationRecord
  belongs_to :player
  belongs_to :team
  validate :valid_amount

  def points
    @points ||= team.points * player_equity
  end

  def player_equity
    @player_equity ||= amount.to_f / team_total_amount.to_f
  end
  
  def player_equity_percent
    @player_equity_percent ||= player_equity * 100
  end

  private
    def team_total_amount
      shares_for_team.inject(0) do |total , share|
        total + share.amount
      end
    end

    def shares_for_team
      Share.where(team_id: team_id)
    end

    def valid_amount
      raise StandardError, 'Amount must be positive number' unless amount > 0
      raise StandardError, 'Amount cannot exceed 100' if amount > 100
    end
end
