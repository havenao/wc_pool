class Result < ApplicationRecord
  belongs_to :team, :class_name => 'Team'
  belongs_to :opponent, :class_name => 'Team'

  def get_team_name(id)
    Team.find(id).name
  end
end


