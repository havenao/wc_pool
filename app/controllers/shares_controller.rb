class SharesController < ApplicationController
  before_action :set_share, only: [:destroy]

  def destroy
    ActiveRecord::Base.transaction do
      @share.player.spend_credits(-@share.amount)
      @share.destroy
    end
    redirect_back fallback_location: players_url, notice: 'Share was successfully deleted.'
  end

  private
    def set_share
      @share = Share.find(params[:id])
    end
end
