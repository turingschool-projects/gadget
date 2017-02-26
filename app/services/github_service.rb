class GithubService

  def self.github(username)
    response = Faraday.get("https://api.github.com/users/#{username}?access_token=ee24cad06ee4becebc076ef33834b5d41ebd3fef")
    parse_json(response.body)
  end

  def self.parse_json(json)
    JSON.parse(json, symbolize_names: true)
  end
end
