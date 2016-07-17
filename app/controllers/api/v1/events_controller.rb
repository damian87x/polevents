class Api::V1::EventsController < ApplicationController
  def index
   @events = Event.includes(:users)
   render json: @events
  end

  def create

  end
end
