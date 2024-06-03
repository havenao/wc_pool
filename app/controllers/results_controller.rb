# app/controllers/results_controller.rb
class ResultsController < ApplicationController
  before_action :check_admin, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_result, only: [:show, :edit, :update, :destroy]

  def index
    @results = Result.all
  end

  def show
  end

  def new
    @result = Result.new
  end

  def edit
  end

  def create
    @result = Result.new(result_params)

    if @result.save
      redirect_to @result, notice: 'Result was successfully created.'
    else
      render :new
    end
  end

  def update
    if @result.update(result_params)
      redirect_to @result, notice: 'Result was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @result.destroy
    redirect_to results_url, notice: 'Result was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_result
      @result = Result.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def result_params
      params.require(:result).permit(:name, :description)
    end

    def check_admin
      redirect_to results_url unless current_user.admin?
    end
end
