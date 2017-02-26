class LinkedinService

  def self.github(username)
    response = Faraday.get("https://api.github.com/users/#{username}")
    parse_json(response.body)
  end

  def self.parse_json(json)
    JSON.parse(json, symbolize_names: true)
  end
end
