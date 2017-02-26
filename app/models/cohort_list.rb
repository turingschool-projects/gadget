class CohortList

attr_reader :first_name, :last_name, :linkedin, :github, :cohort

  def initialize(service_info={})
    @first_name   = service_info[:first_name]
    @last_name    = service_info[:last_name]
    @linkedin     = service_info[:linked_in]
    @github       = service_info[:git_hub]
    @cohort       =  service_info[:cohort][:name]

  end


  def self.cohort_list(token, cohort)
    CensusService.new.cohort_list(token, cohort, ).map do |raw_info|
      CohortList.new(raw_info)
    end
  end
end
