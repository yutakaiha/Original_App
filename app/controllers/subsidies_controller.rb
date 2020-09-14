class SubsidiesController < ApplicationController
  def index
    @search_subsidy = Subsidy.ransack(params[:q])
    @subsidies = @search_subsidy.result.page(params[:page]).per(Settings.service.subsidy_pagination)
  end

  def show
    if Subsidy.where(id: params[:id]).any?
      @subsidy = Subsidy.find(params[:id])
    else
      flash[:error] = 'データが存在しません。'
      redirect_to subsidies_path
    end
  end
end
