class SearchController < ApplicationController

  def index
    zip_code = params[:zip_code]

    @conn = Faraday.new(url: "") do |faraday|
      faraday.headers[""] = ""
      faraday.apapter Faraday.default_adapter
    end

    response = @conn.get("")

    @stations = JSON.parse(response.body, symbolize_names: true)[:results]
  end

  # def index
  # state = params[:state]
  # @conn = Faraday.new(url: "https://api.propublica.org") do |faraday|
  #   faraday.headers["X-API-KEY"] = "S9JON3ruNOI6XiyymcnZ7gtsjnToPxuXyT0bgeaX"
  #   faraday.adapter Faraday.default_adapter
  # end
  #
  # response = @conn.get("/congress/v1/members/house/#{state}/current.json")

  # @members = JSON.parse(response.body, symbolize_names: true)[:results]
end
