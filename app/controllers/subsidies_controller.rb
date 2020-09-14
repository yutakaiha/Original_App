class SubsidiesController < ApplicationController
  def index
    @search_subsidy = Subsidy.ransack(params[:q])
    @subsidies = @search_subsidy.result.page(params[:page]).per(8)
  end

  def show
    @subsidy = Subsidy.find(params[:id])
  end
end
