class SearchFacade

  def initialize(search_results)
    # binding.pry
    @search_results = search_results
  end

  def station_info
    nearest_station = @search_results.nearest_station
    station ||= format_station_info(nearest_station)
  end

  def directions
    station_directions = @search_results.directions
    format_directions(station_directions)
  end

  private

  def format_station_info(nearest_station)
    nearest_station = nearest_station[:fuel_stations].first
    station_info = {
      station_name: nearest_station[:station_name],
      street_address: nearest_station[:street_address],
      fuel_type: nearest_station[:fuel_type_code],
      access_times: nearest_station[:access_days_time]
    }
    Station.new(station_info)
  end

  def format_directions(directions)
    directions = directions[:route]
    direction_info = {
      distance: directions[:distance],
      time: directions[:realTime]/60,
      legs: directions[:legs]
    }
    Directions.new(direction_info)
  end
end
