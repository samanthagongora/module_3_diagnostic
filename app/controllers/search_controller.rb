class SearchController < ApplicationController
  def index
    zip_code = params[:q]
    conn = Faraday.new(:url => 'https://api.data.gov/nrel/alt-fuel-stations/v1.json') do |faraday|
      faraday.adapter  Faraday.default_adapter
    end

    response = conn.get "/nrel/alt-fuel-stations/v1.json", { :api_key => "#{ENV['nrel_key']}", :zip => "#{zip_code}", :radius => "6.0", :fuel_type => "ELEC, LNG", :limit => '10' }
byebug
    @stations = JSON.parse(response.body)
  end
end
