class SearchController < ApplicationController

  def index
    zip_code = params[:zip_code]

    @conn = Faraday.new(url: "https://developer.nrel.gov") do |faraday|
      # faraday.headers["X-API-KEY"] = ENV["API_KEY"]
      faraday.adapter Faraday.default_adapter
    end

    response = @conn.get("/api/alt-fuel-stations/v1.json?location=#{zip_code}&fuel_type=ELEC,LPG&radius=6.0&limit=10&api_key=#{ENV['API_KEY']}&format=JSON")

    results = JSON.parse(response.body, symbolize_names: true)[:fuel_stations]

    @stations  = results.map do |result|
      Station.new(result)
    end
  end
end
