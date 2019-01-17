class Api::V1::CountriesController < ApplicationController

    def index 
        @countries = Country.all 
        render(json: @countries)
    end 
    
    def show
        @trip = Trip.find(params[:id])
    end 

    private 
    def country_params
        params.permit(:name, :region, :subregion, :currency)
    end 


end