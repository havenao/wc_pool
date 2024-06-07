class ResultsController < ApplicationController
  before_action :set_result, only: [:destroy]
  before_action :require_admin

  def index
    @results = Result.joins(:team).order('teams.name ASC')
  end

  def destroy
    @result.destroy
    redirect_back fallback_location: results_url, notice: 'Result was successfully deleted.'
  end

  private
    def set_result
      @result = Result.find(params[:id])
    end

    def require_admin
      unless current_user&.admin?
        redirect_to(root_path)
      end
    end
end