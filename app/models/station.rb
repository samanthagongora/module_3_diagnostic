class Station
  attr_reader :name,
              :fuel_types,
              :street_address,
              :city,
              :state,
              :zip,
              :access_day_and_time

  def initialize(params)
    @name = params["station_name"]
    @fuel_types = params["fuel_type_code"]
    @street_address = params["street_address"]
    @city = params["city"]
    @state = params["state"]
    @zip = params["zip"]
    @access_day_and_time = params["access_days_time"]
  end

  def self.create_new(params)
    stations = []
    params.each do |param_set|
      stations << Station.new(param_set)
    end
    stations
  end
end
