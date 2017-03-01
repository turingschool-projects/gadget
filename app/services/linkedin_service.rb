require 'linkedin-scraper'

class LinkedinService

  def self.scrape(username)
    begin
      Linkedin::Profile.new("http://www.linkedin.com/in/#{username}")
    rescue
      ""
    else
      return Linkedin::Profile.new("http://www.linkedin.com/in/#{username}")
    end
  end
end
