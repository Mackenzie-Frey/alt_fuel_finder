class Station
  attr_reader :name, :address, :fuel_types, :distance, :access_times

  def initialize(attributes = {})
    @name = attributes[:name]
    @address = attributes[:address]
    @fuel_types = attributes[:fuel_types]
    @distance = attributes[:distance]
    @access_times = attributes[:access_times]
  end

  def find_all
    stations = StationService.find_stations.map do |station|
    Station.new(station)
  end
  
end
