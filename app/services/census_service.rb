class CensusService
  attr_reader :conn

  def initialize
    @conn ||= Faraday.new(url: 'https://census-app-staging.herokuapp.com') do |faraday|
      faraday.adapter  Faraday.default_adapter
    end
  end

  def cohorts(token)
    cohort_response = conn.get do |req|
      req.url "/api/v1/cohorts"
      req.params[:access_token] = token
    end 
    parse_json(cohort_response.body)
  end

  def parse_json(json)
    JSON.parse(json, symbolize_names: true)
  end 
end