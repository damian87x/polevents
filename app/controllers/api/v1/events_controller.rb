class Api::V1::EventsController < ApplicationController
  def index
   @events = Event.includes(:city, :user,:topic, :users_events)
   render json: @events
  end

  def create
  end
end
