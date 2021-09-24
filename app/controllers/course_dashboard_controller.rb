class CourseDashboardController < ApplicationController
  def index
    @courses = Course.all
    @course_specialties = CourseSpecialty.all
    @specialties = Specialty.all
    @programmes = Programme.all
    @programmes_courses = ProgrammeCourse.all

    if (params[:programme_id])
      @current_programme_id =  params[:programme_id]
    end  #else
  end
end
