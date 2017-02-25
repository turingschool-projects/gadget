class CohortsController < ApplicationController
  def index
    @cohorts = Cohorts.all_cohorts(current_user.access_token)
  end

  def verify 
    @list = CohortList.cohort_list(current_user.access_token, "1608")
    
  end
end
