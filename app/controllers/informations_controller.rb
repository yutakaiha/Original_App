class InformationsController < ApplicationController
  def index
    @informations = Information.order(created_at: :desc)
    
  end

  def show

  end
end
