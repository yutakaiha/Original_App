class EventsController < ApplicationController
  def show
    if params[:id].present?
      @event = Event.find(params[:id])
    else
      redirect_to root_path
    end
  end
end
