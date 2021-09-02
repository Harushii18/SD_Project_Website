class DashboardController < ApplicationController
  def index
    @hospitals = Hospital.all
    @specialties = Specialty.all
    @allocations = Allocation.all
    @schedules= Schedule.all
    @users= User.all
  end
end
