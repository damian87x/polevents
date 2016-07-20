class Api::V1::EventsController < ApplicationController
  def index
    if params[:city_id]
      p = params.compact
      @events = Event.search_by_filters(p)
      current_user.update_filters(p)
    else
      @events = Event.search_all
    end
    render json: @events
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      render json: @event
    else
      render json: @event.errors, status: :unprocessable_entity
    end
  end

  def show
    @event = Event.find(params[:id])
    render json: @event
  end


  private

  def event_params
    params.require(:event).permit(:name, :start_time, :city_id, :user_id, :topic_id, :end_time)
  end


end
