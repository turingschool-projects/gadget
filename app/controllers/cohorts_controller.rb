class CohortsController < ApplicationController

  def index
    @cohorts = Cohorts.all_cohorts(current_user.access_token)
  end

  def verify
    if(params[:cohorts])
      cohorts = params[:cohorts]

      @results = cohorts.reduce([]) do |results, id|
        @list = CohortList.cohort_list(current_user.access_token, id)
        results << @list
        results
      end
    end
    array = []
    @results.flatten.each do |student|
      array << Student.cohort_list(student.github)
    end
    array
    require "pry"; binding.pry
  end

end
