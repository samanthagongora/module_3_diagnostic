class SearchController < ApplicationController
  def index
    byebug
    @stations = NrelService.find_stations(params[:q])["fuel_stations"]
  end
end
