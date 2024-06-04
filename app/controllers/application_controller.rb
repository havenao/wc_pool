class ApplicationController < ActionController::Base
  before_action :authenticate_user!, unless: :devise_controller?
  before_action :ensure_player_profile, unless: :devise_controller?
  before_action :set_global_variables

  private

  def set_global_variables
    @tourny_started = ENV['BETTING_CLOSED'] == 'true'
    @debug_mode = true
  end

  def ensure_player_profile
    if current_user && current_user.player.nil?
      redirect_to new_player_path
    end
  end
end
