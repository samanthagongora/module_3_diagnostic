class SearchController < ApplicationController
  def index
    zip_code = params[:q]
    @conn = Faraday.new(:url => '/nrel/alt-fuel-stations/v1.json') do |faraday|

    response = conn.get(/)
  end
end
