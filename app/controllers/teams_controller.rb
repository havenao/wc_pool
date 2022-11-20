class TeamsController < ApplicationController
  def index
    @teams = Team.all
  end

  def show
    @team = Team.find(params[:id])
    @results = Result.where(team_id: @team.id)
    
  end

  def new
    @teams = Team.all
    @team = Team.new
  end

  def create
    @team = Team.new(team_params.merge({points: 0}))

    if @team.save
      redirect_to @team
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @team = Team.find(params[:id])
  end

  def update
    @team = Team.find(params[:id])

    if @team.update(team_params)
      redirect_to @team
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
  end

  def add_result
    @team = Team.find(params[:id])
    opponent = Team.where(name: params[:opponent]).take
    text = params[:text]

    result_hash = {
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

    Result.create({:team_id => @team.id, :opponent_id => opponent.id, :text => text, :points => result_hash[text]})
    if(text == "Group Stage Draw")
      Result.create({:team_id => opponent.id, :opponent_id => @team.id, :text => text, :points => result_hash[text]})
    else
      Result.create({:team_id => opponent.id, :opponent_id => @team.id, :text => "Loss", :points => result_hash["Loss"]})
    end

    redirect_to @team
  end

  private 
    def team_params
      params.require(:team).permit(:name, :points)
    end
end
# result_hash = {
#   "Loss" => 0,
#   "Group Stage Draw" => 100,
#   "Group Stage Win" => 200,
#   "Group Stage Runner-Up" => 200,
#   "Group Stage Champion" => 400,
#   "First Knockout Win" => 400,
#   "Quarter-Final Win" => 900,
#   "Semi-Final Win" => 1200,
#   "Cup Champion" => 1500,
# }