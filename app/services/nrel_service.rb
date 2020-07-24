class NrelService
  include ServiceHelper

  def initialize(location)
    @location = location
  end

  def nearest_station
    get_json("/api/alt-fuel-stations/v1/nearest")
  end

  private

  def conn
    Faraday.new(url: "https://developer.nrel.gov") do |faraday|
      faraday.params['format'] = 'json'
      faraday.params['api_key'] = ENV['NREL_API_KEY']
      faraday.params['location'] = @location
    end
  end
end
