class PlayersController < ApplicationController
  skip_before_action :ensure_player_profile, only: [:new, :create]
  before_action :ensure_single_player_profile, only: [:new, :create]
  before_action :set_player, only: [:show, :edit, :update, :destroy]

  def index
    @players = Player.order(points: :desc)
  end
  
  def show
    player_team_ids = @player.shares.map{|s| s.team_id }
    @unbought_teams = Team.order(name: :asc).reject{|t| player_team_ids.include?(t.id) }
    @shares = Share.where(player_id: @player.id).order(points: :desc, amount: :desc)
  end

  def new
    @player = Player.new
    # @players = Player.order(name: :asc).all
  end

  def create
    @player = Player.new(player_params)
    @player.user = current_user

    if @player.save
      redirect_to new_player_path
    else
      flash[:alert] = @player.errors.full_messages
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @player.update(player_params)
      redirect_to @player
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def edit
  end

  def destroy
  end

  def invest
    @player = Player.find(params[:player])
    raise StandardError, "Amount must be positive number!" unless params[:amount].to_i > 0
    raise StandardError, "Amount cannot exceed 100!" if params[:amount].to_i > 100

    if found = @player.shares.find { |s| s.team.id == params[:team].to_i}
      raise StandardError, "You already have shares for #{found.team.name}!"
    end

    @player.spend_credits(params[:amount])
    share = Share.create({:amount => params[:amount], :player_id => params[:player], :team_id => params[:team]})

    flash[:notice] = "Bought #{share.amount} shares for #{share.team.name}"
    redirect_to @player
  rescue StandardError => e
    flash[:alert] = e.message
    redirect_to @player
  end

  private
    def set_player
      @player = Player.find(params[:id])
    end

    def player_params
      params.require(:player).permit(:name)
    end

    def ensure_single_player_profile
      puts current_user&.inspect
      if current_user&.player.present?
        puts "uh oh"
        redirect_to current_user&.player, alert: 'You already have a player profile.'
      end
    end
end