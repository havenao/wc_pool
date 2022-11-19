class TeamsController < ApplicationController
  def index
    @teams = Team.all
  end

  def show
    @team = Team.find(params[:id])
  end

  def new
    @teams = Team.all
    @team = Team.new
  end

  def create
    puts team_params
    @team = Team.new(team_params.merge({points: 0}))

    if @team.save
      redirect_to new_teams_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
  end

  def edit
  end

  def destroy
  end

  private 
    def team_params
      params.require(:team).permit(:name)
    end
end
