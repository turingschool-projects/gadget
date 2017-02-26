class Student
  def initialize(service_info={})
    @name    = service_info[:name]
    @picture = service_info[:avatar_url]

  end


  def self.cohort_list(username)
    Student.new(GithubService.github(username))

  end
end
