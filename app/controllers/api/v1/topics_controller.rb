class Api::V1::TopicsController < ApplicationController
  def index
    render json: Topic.all
  end
end
