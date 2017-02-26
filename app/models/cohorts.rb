class Cohorts

attr_reader :name, :id, :status, :email
  def initialize(service_info={})
    @name   = service_info[:name]
    @id     = service_info[:id]
    @status = service_info[:status]
    @email  = service_info[:email]
  end


  def self.all_cohorts(token)
    CensusService.new.cohorts(token).map do |raw_info|
      Cohorts.new(raw_info)
    end
  end
end
