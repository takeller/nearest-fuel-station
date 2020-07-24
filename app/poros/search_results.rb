class SearchResults

  def initialize(search_params)
    @nrel_service ||= NrelService.new(search_params[:location])
    @mapquest_service ||= MapquestService.new
  end

  def nearest_station
    json = @nrel_service.nearest_station
  end
end
