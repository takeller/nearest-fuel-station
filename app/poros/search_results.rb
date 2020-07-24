class SearchResults

  def initialize(search_params)
    @location = search_params[:location]
    # @nrel_service ||= NrelService.new(search_params[:location])
    # @mapquest_service ||= MapquestService.new(directions_params)
  end

  def nearest_station
    json ||= nrel_service.nearest_station
  end

  def directions
    json ||= mapquest_service.directions
  end

  private

  def nrel_service
    nrel_service ||= NrelService.new(@location)
  end

  def mapquest_service
    mapquest_service ||= MapquestService.new(direction_params)
  end

  def direction_params
    lat = nearest_station[:fuel_stations].first[:latitude]
    long = nearest_station[:fuel_stations].first[:longitude]
    {
      from: @location,
      to: "#{lat}, #{long}"
    }
  end
end
