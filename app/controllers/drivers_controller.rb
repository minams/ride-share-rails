class DriversController < ApplicationController
  def index
    @drivers = Driver.order(:name)
  end

  def show
    @driver = Driver.find_by(id: params[:id])
  end

  def new
    @driver = Driver.new
  end

  def create
    @driver = Driver.new(driver_info)

    if @driver.save
      redirect_to driver_path
    else
      render :new
    end
  end

  def edit
    @driver = Driver.find_by(id: params[:id])
  end

  def update
    @driver = Driver.find_by(id: params[:id])

    if @driver.update_attributes(driver_info)
      redirect_to driver_path(@driver.id)
    else
      render :edit
    end
  end
end
