class StationService

  # def self.find_musicians
  #   conn = Faraday.new(url: "api-url-goes-here") do |faraday|
  #     faraday.headers["header-key-here"] = "header value here"
  #     faraday.adapter Faraday.default_adapter
  #   end
  #   response = conn.get("specific-api-uri-here")
  #   @musicians = JSON.parse(response.body, symbolize_names: true)
  # end

  def self.find_stations
    zip_code = params[:zip_code]

    @conn = Faraday.new(url: "https://developer.nrel.gov") do |faraday|
      # faraday.headers["X-API-KEY"] = ENV['API_KEY']
      faraday.adapter Faraday.default_adapter
    end

    response = @conn.get("/api/alt-fuel-stations/v1/nearest.format?location=#{zip_code}&fuel_type=ELEC&fuel_type=LPG&radius=6.0&limit=10&api_key=#{ENV['API_KEY']}")

    @stations = JSON.parse(response.body, symbolize_names: true)[:results]
  end
  
end

# class MusicianService
#   def initialize
#     @connection = engage_faraday
#   end
#   def find_musicians
#     get_url("specific-api-uri-here")
#   end
#   def get_url(address)
#     response = @connection.get(address)
#     JSON.parse(response.body, symbolize_names: true)
#   end
#   def self.find_musicians
#     new.find_house_members
#   end
# end
