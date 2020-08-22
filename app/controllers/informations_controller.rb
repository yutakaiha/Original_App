class InformationsController < ApplicationController
  
  def index  
    @informations = Information.order(created_at: :desc).page(params[:page]).per(5)
  end

  def show
    @information = Information.find(params[:id])
    impressionist(@information, nil, :unique => [:session_hash])
  end

end
