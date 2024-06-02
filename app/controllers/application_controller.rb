class ApplicationController < ActionController::Base
  before_action :authenticate_user!, unless: :devise_controller?
  before_action :ensure_player_profile, unless: :devise_controller?

  private

  def ensure_player_profile
    if current_user && current_user.player.nil?
      redirect_to new_player_path
    end
  end
end
