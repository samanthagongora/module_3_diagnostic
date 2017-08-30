class SearchController < ApplicationController
  def index
    zip_code = params[:q]
    @conn = Faraday.new(:url => 'https://api.data.gov/nrel/alt-fuel-stations/v1.json') do |faraday|
      faraday.adapter  Faraday.default_adapter
    end

    response = @conn.get "/nrel/alt-fuel-stations/v1.json", { :limit => '10', :api_key => "#{ENV['nrel_key']}" }
byebug
  end
end
