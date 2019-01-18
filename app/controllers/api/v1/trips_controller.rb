class Api::V1::TripsController < ApplicationController
    before_action :set_trip, only: [:show, :update, :destroy]
    
    def index
        @trips = Trip.all 
        render(json: @trips)
    end 

    def show
        render json: @card, status: 200
    end 

    def create
        @trip = Trip.create(trip_params)
        render json: @trip, status: 201
    end 

    def update
        @trip.update(trip_params)
        render json: @trip, status: 200
    end 

    def destroy
        tripId = @trip.id
        @trip.destroy 
        render json: {message:"Trip deleted"}
    end 

    private 
    def trip_params
        params.permit(:picture, :rating, :description, :price, :name, :country_id, :user_id)
    end 

    def set_trip
        @trip = Trip.find(params[:id])
    end 

end 