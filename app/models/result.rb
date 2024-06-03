class Result < ApplicationRecord
  belongs_to :team, :class_name => 'Team'
  belongs_to :opponent, :class_name => 'Team'

  def self.points_map
    {
      "Loss" => 0,
      "Group Stage Draw" => 100,
      "Group Stage Win" => 200,
      "Group Stage Runner-Up" => 200,
      "Group Stage Champion" => 400,
      "First Knockout Win" => 400,
      "Quarter-Final Win" => 900,
      "Semi-Final Win" => 1200,
      "Cup Champion" => 1500,
    }
  end
end


