class Api::V1::FiltersController < ApplicationController
  before_action :set_filter, only: [:update]

  def index
    @filters = current_user.filters
    render json: @filters
  end

  def create
    @filter = Filter.new(filter_params)
    if @filter.save
      render json: @filter
    else
      render json: @filter.errors, status: :unprocessable_entity
    end
  end

  def update
    if @filter.update_attributes(filter_params)
      render json: @filter, status: :ok
    else
      render json: @dev_issue.errors, status: :unprocessable_entity
    end
  end

  private

  def set_filter
    @filter = Filter.find(params[:id])
  end

  def filter_params
    params.require(:filter).permit(:user_id,:owner_id,:owner_type)
  end


end
