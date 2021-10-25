class DashboardController < ApplicationController
  before_action :authenticate_admin!
  def index
    @hospitals = Hospital.all
    @specialties = Specialty.all
    @allocations = Allocation.all

    if (params[:hospital_id])
      @current_hospital_id =  params[:hospital_id]
    end  #else

    @schedules= Schedule.all
    @users= User.all
    @site_facilitators = SiteFacilitator.all
    @site_facilitator_allocations = SiteFacilitatorAllocation.all
  end
end
