class TeamsController < ApplicationController
  def index
    teams = Team.order(points: :desc)
    @top_teams = teams.slice(0, 16)
    @bottom_teams = teams.slice(16, 31)
  end

  def show
    @teams = Team.all
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
      redirect_to new_team_path
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
    # Get team and opponent
    @team = Team.find(params[:id])
    opponent = Team.where(name: params[:opponent]).take

    # text from form... Must match a text key in result hash below.
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

    if(text == "Group Stage Draw")
      Result.create({:team_id => @team.id, :opponent_id => opponent.id, :text => text, :points => result_hash[text]})
      Result.create({:team_id => opponent.id, :opponent_id => @team.id, :text => text, :points => result_hash[text]})
    else
      Result.create({:team_id => @team.id, :opponent_id => opponent.id, :text => text, :points => result_hash[text]})    
      Result.create({:team_id => opponent.id, :opponent_id => @team.id, :text => "Loss", :points => result_hash["Loss"]})
    end

    @team.update_points
    opponent.update_points

    # I believe Shares needs to update beforw player for accurate scoring.
    Share.update_points
    Player.update_points


    redirect_to @team
  end

  private 
    def team_params
      params.require(:team).permit(:name, :points)
    end
end