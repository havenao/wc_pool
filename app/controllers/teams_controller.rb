class TeamsController < ApplicationController
  def index
    @teams = Team.order(points: :desc)
    @team_groups = @teams.group_by(&:group)
    @knockout_stage = Result.where("text LIKE ?", "%Round of Sixteen%").exists?
  end

  def show
    @team = Team.find(params[:id])
    @teams = Team.all.order(name: :asc).reject { |t| t == @team }
    @results = Result.where(team_id: @team.id)
    @result_options = Result.points_map.keys.reject { |k| k == "Loss" }

    @shares = Share.where(team_id: @team.id).order(amount: :desc)
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
    return unless current_user&.admin?
    ActiveRecord::Base.transaction do
      @team = Team.find(params[:id])
      opponent = Team.where(name: params[:opponent]).take

      text = params[:text]

      map = Result.points_map
      if text.include? "Bonus"
        result = Result.create({:team_id => @team.id, :text => text, :points => map[text]})
      elsif(text == "Group Stage Draw")
        Result.create({:team_id => @team.id, :opponent_id => opponent.id, :text => text, :points => map[text]})
        Result.create({:team_id => opponent.id, :opponent_id => @team.id, :text => text, :points => map[text]})
      else
        Result.create({:team_id => @team.id, :opponent_id => opponent.id, :text => text, :points => map[text]})    
        Result.create({:team_id => opponent.id, :opponent_id => @team.id, :text => "Loss", :points => map["Loss"]})
      end
    end

    redirect_to @team
  end

  private 
    def team_params
      params.require(:team).permit(:name, :points)
    end
end