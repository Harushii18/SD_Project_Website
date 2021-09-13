class CourseDashboardController < ApplicationController
  def index
    @courses = Course.all
    @course_specialties = CourseSpecialty.all
    @specialties = Specialty.all
  end
end
