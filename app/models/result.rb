class Result < ApplicationRecord
  belongs_to :team, :class_name => 'Team'
  belongs_to :opponent, :class_name => 'Team', optional: true

  def self.points_map
    {
      "Loss" => 0,
      "Group Stage Draw" => 100,
      "Group Stage Win" => 200,
      "Bonus: Group Stage 3rd Place" => 100,
      "Bonus: Group Stage 2nd Place" => 200,
      "Bonus: Group Stage 1st Place" => 400,
      "Round of Sixteen Win" => 400,
      "Quarter-Final Win" => 900,
      "Semi-Final Win" => 1200,
      "Cup Champion" => 1500,
    }
  end
end


