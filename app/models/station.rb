class Station
  attr_reader :name,
              :address,
              :fuel_types,
              :access_times

  def initialize(attributes = {})
    binding.pry
    @name = attributes[:station_name]
    @address = attributes[:street_address]
    @fuel_types = attributes[:fuel_type_code]
    @access_times = attributes[:access_days_time]
  end

end
