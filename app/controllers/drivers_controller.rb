class DriversController < ApplicationController
  def index
    @drivers = Driver.order(:name)
  end

  def show
    @driver = Driver.find_by(id: params[:id])

    if @driver.nil?
      head :not_found
    end
  end

  def new
    @driver = Driver.new
  end

  def create
    @driver = Driver.new(driver_info)

    if @driver.save
      redirect_to driver_path(@driver.id)
    else
      render :new, status: :bad_request
    end
  end

  def edit
    @driver = Driver.find_by(id: params[:id])

    if @driver.nil?
      head :not_found
    end
  end

  def update
    @driver = Driver.find_by(id: params[:id])
    if !@driver
      head :not_found
    else
      if @driver.update(driver_info)
        redirect_to driver_path(@driver.id)
      else
        render :edit, status: :not_found
      end
    end
  end

  def destroy
    driver = Driver.find_by(id: params[:id])

    if driver.nil?
      head :not_found
    else
      driver.destroy
      redirect_to drivers_path
    end
  end

  private

  def driver_info
    return params.require(:driver).permit(:name, :vin, :availability)
  end
end
