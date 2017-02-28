require 'linkedin-scraper'

class LinkedinService

  def self.scrape(username)
    if username.length > 0
     Linkedin::Profile.new("http://www.linkedin.com/in/#{username}")
   else
     username
    end 
  end
end
