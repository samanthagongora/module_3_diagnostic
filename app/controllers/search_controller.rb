class SearchController < ApplicationController
  def index
    stations = NrelService.find_stations(params[:q])
    @stations = Station.create_new(stations)
  end
end
