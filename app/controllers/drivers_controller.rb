class DriversController < ApplicationController
  def index
    @drivers = Driver.order(:name)
  end

  def show
    @driver = Driver.find_by(id: params[:id])
  end

  def edit
    @driver = Driver.find_by(id: params[:id])
  end
end
