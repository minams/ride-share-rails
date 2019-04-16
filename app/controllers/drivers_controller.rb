class DriversController < ApplicationController
  def index
    @drivers = Driver.order(:name)
  end

  def show
  end
end
