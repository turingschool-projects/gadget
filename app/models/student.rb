class Student
  attr_reader :github_name, :github_picture, :github, :linkedin,
              :first_name, :last_name, :cohort, :linkedin_name, :linkedin_picture

  def initialize(service_info={}, student=nil, linkedin={})
    @github_name      = service_info[:name]
    @github_picture   = service_info[:avatar_url]
    @github           = student.github
    @linkedin         = student.linkedin
    @first_name       = student.first_name
    @last_name        = student.last_name
    @cohort           = student.cohort
    # @linkedin_name    = "#{linkedin.first_name} #{linkedin.last_name}" if linkedin != "" && linkedin != nil
    # @linkedin_picture = linkedin.picture if linkedin != "" && linkedin != nil
  end

  def name
    "#{first_name} #{last_name}"
  end

  def self.cohort_list(username, student)
    # Student.new(GithubService.github(username), student, LinkedinService.scrape(student.linkedin))
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

  def linkedin_name_matches?
    if !name.nil? && !linkedin_name.nil?
      linkedin_name.gsub(' ', '') == name.gsub(' ', '')
    else
      false
    end
  end

  def linkedin_picture_exists?
    !linkedin_picture.nil?
  end

end
