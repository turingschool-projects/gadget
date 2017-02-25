class CohortsController < ApplicationController
  def index
    @cohorts = Cohorts.all_cohorts(current_user.access_token)
  end

  def verify 
    if(params[:cohorts])
      cohorts = params[:cohorts]
      @array = []
      cohorts.each do |id|
        @list = CohortList.cohort_list(current_user.access_token, id)
        @array << @list 
      end 
      @array
    end
  end
end
