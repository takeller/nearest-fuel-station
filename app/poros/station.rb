class Station

  attr_reader :station_name, :street_address, :fuel_type, :access_times
  def initialize(station_info)
    @station_name = station_info[:station_name]
    @street_address = station_info[:street_address]
    @fuel_type = station_info[:fuel_type]
    @access_times = station_info[:access_times]
  end
end
