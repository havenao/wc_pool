class PlayersController < ApplicationController
  skip_before_action :ensure_player_profile, only: [:new, :create]
  before_action :ensure_single_player_profile, only: [:new, :create]

  def index
    @players = Player.order(points: :desc)
  end
  
  def show
    @player = Player.find(params[:id])
    @teams = Team.order(name: :asc).all
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
    @player = Player.find(params[:id])

    if @player.update(player_params)
      redirect_to @player
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def edit
    @player = Player.find(params[:id])
  end

  def destroy
  end

  def invest
    @player = Player.find(params[:player])
    Share.create({:amount => params[:amount], :player_id => params[:player], :team_id => params[:team]})
    redirect_to @player
  end

  private 
    def player_params
      params.require(:player).permit(:name)
    end

    def ensure_single_player_profile
      puts current_user.inspect
      if current_user.player.present?
        puts "uh oh"
        redirect_to current_user.player, alert: 'You already have a player profile.'
      end
    end
end