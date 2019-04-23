class TripsController < ApplicationController
  def index
    if params[:passenger_id]
      passenger = Passenger.find_by(id: params[:passenger_id])
      @trips = passenger.trips
    else
      @trips = Trip.all
    end
  end

  def show
    @trip = Trip.find_by(id: params[:id])
  end

  def edit
    @trip = Trip.find_by(id: params["id"])
  end

  def edit_rating
    @trip = Trip.find_by(id: params[:id])
  end

  def update
    @trip = Trip.find_by(id: params[:id])
    if !@trip
      head :not_found
    else
      if @trip.update(trip_params)
        redirect_to passenger_path(@trip.passenger.id)
      else
        render :edit, status: :not_found
      end
    end
  end

  def update_rating
    @trip = Trip.find_by(id: params["id"])

    @trip.rating = params[:trip][:rating].to_i
    passenger = Trip.find(@trip.id).passenger
    @trip.save
    redirect_to passenger_path(passenger.id)
  end

  def new
    @trip = Trip.new
  end

  def create
    passenger = Passenger.find_by(id: params[:passenger_id])
    driver = Driver.where(status: "available").sample

    @trip = Trip.new(
      passenger: passenger,
      driver: driver,
      date: Date.today,
      cost: rand(170..5000),
    )

    is_successful = @trip.save

    if is_successful
      @trip.driver.status = "unavailable"
      @trip.driver.save
      redirect_to passenger_path(@trip.passenger_id)
    else
      head :internal_server_error
    end
  end

  def destroy
    @trip = Trip.find_by(id: params[:id]).destroy
    passenger_id = @trip.passenger.id
    redirect_to passenger_path(passenger_id)
  end

  private

  def trip_params
    return params.require(:trip).permit(:passenger_id, :date, :rating, :driver_id, :cost)
  end
end
