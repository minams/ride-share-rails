class PassengersController < ApplicationController
  def index
    @passengers = Passenger.all.order(:name)
  end

  def show
    passenger_id = params[:id]
    @passenger = Passenger.find_by(id: passenger_id)

    if @passenger.nil?
      head :not_found # refactor to render
    end
  end

  def new
    @passenger = Passenger.new
  end

  def create
    passenger = Passenger.new(passenger_params)

    is_successful = passenger.save

    if is_successful
      redirect_to passenger_path(passenger.id)
    else
      @passenger = passenger
      render :new, status: :bad_request
    end
  end

  def edit
    @passenger = Passenger.find_by(id: params[:id])

    if @passenger.nil?
      head :not_found
    end
  end

  def update
    @passenger = Passenger.find_by(id: params[:id])

    if @passenger.update_attributes(passenger_params)
      redirect_to driver_path(@passenger.id)
    else
      render :edit
    end
  end

  def destroy
    passenger = Passenger.find_by(id: params[:id])

    if passenger.nil?
      head :not_found
    else
      passenger.destroy
      redirect_to passengers_path
    end
  end

  private

  def passenger_params
    return params.require(:passenger).permit(:name, :phone_num)
  end
end
