class InformationsController < ApplicationController
  def index
    @informations = Information.order(created_at: :desc).page(params[:page]).per(Settings.service.info_pagination)
  end

  def show
    if Information.where(id: params[:id]).any?
      @information = Information.find(params[:id])
      impressionist(@information, nil, unique: [:session_hash])
    else
      flash[:error] = 'データが存在しませんでした。'
      redirect_to informations_path
    end
  end
end
