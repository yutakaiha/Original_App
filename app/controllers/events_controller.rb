class EventsController < ApplicationController
  def show
    if Event.where(id: params[:id]).any?
      @event = Event.find(params[:id])
      @subsidies = @event.subsidies.order(start_date: :desc).page(params[:page]).per(Settings.service.event_pagination)
    else
      flash[:error] = 'データが存在しません。'
      redirect_to root_path
    end
  end
end
