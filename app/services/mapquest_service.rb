class MapquestService
  include ServiceHelper

  def initialize(directions_params)
    @from = directions_params[:from]
    @to = directions_params[:to]
  end

  def directions
    get_json("/directions/v2/route")
  end

  private

  def conn
    Faraday.new(url: "http://www.mapquestapi.com") do |faraday|
      faraday.params['key'] = ENV['MAP_QUEST_CLIENT_KEY']
      faraday.params['from'] = @from
      faraday.params['to'] = @to
    end
  end
end
