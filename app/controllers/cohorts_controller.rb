class CohortsController < ApplicationController
  def index
    @cohorts = Cohorts.all_cohorts(current_user.access_token)
  end
end
