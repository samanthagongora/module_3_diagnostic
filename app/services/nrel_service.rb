class NrelService
  def initialize(zip_code)
    @zip_code = zip_code
    @conn = Faraday.new(:url => 'https://api.data.gov/nrel/alt-fuel-stations/v1.json') do |faraday|
      faraday.adapter  Faraday.default_adapter
    end
  end

  def find_nearest_stations
    response = @conn.get "/nrel/alt-fuel-stations/v1.json",
    { :api_key => "#{ENV['nrel_key']}",
      :zip => "#{@zip_code}",
      :radius => "6.0",
      :fuel_type => "ELEC, LNG",
      :limit => '10' }
    results = JSON.parse(response.body)["fuel_stations"]
  end

  def self.find_stations(zip_code)
    new(zip_code).find_nearest_stations
  end
end
