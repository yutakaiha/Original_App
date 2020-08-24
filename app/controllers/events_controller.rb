class EventsController < ApplicationController
  def show
    if params[:id].present?
      @event = Event.find(params[:id])
      @subsidies = @event.subsidies.order(start_date: :desc).page(params[:page]).per(12)
    else
      redirect_to root_path
    end
  end
end
