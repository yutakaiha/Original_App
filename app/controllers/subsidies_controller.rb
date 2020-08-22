class SubsidiesController < ApplicationController
  def index
    @subsidies = Subsidy.order(start_date: :desc).page(params[:page]).per(16)
  end

  def show
    @subsidy = Subsidy.find(params[:id])
    
  end
end
