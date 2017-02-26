class Student
  attr_reader :github_name, :github_picture, :github, :linkedin, :name, :cohort
  def initialize(service_info={}, student=nil)
    require "pry"; binding.pry
    @github_name    = service_info[:name]
    @github_picture = service_info[:avatar_url]
    @github         = student.github
    @linkedin       = student.linkedin
    @name           = "#{student.first_name} #{student.last_name}"
    @cohort          = student.cohort
  end


  def self.cohort_list(username, student)
    Student.new(GithubService.github(username), student)
  end

  def linkedin_exists?
    linkedin.length > 0
  end

  def github_exists?
    github.length > 0
  end
  def github_picture_exists?
    !github_picture.nil?
  end

  def github_name_matches?
    if !name.nil? && !github_name.nil?
      github_name.gsub(' ', '') == name.gsub(' ', '')
    else
      false
    end
  end
end
