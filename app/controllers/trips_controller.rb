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
    if @trip.update_attributes trip_params
      redirect_to passenger_path(@trip.passenger.id)
    else
      render :edit
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
    @trip = Trip.new

    passenger = Passenger.find_by(id: params[:passenger])

    @trip.passenger = passenger
    @trip.driver = Driver.all.sample

    @trip.date = Date.today.to_s

    @trip.cost = 1000 #$10

    if @trip.save
      redirect_to passenger_path(params[:passenger])
    end
  end

  def destroy
    @trip = Trip.find_by(id: params[:id]).destroy
    passenger_id = @trip.passenger.id
    redirect_to passenger_path(passenger_id)
  end

  private

  def trip_params
    return params.require(:trip).permit(:passenger_id, :date, :rating, :driver_id)
  end
end
