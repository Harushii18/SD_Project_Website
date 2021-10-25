class ProgrammeCoursesController < ApplicationController
  before_action :authenticate_admin! #definition found in application_controller.rb
  before_action :set_programme_course, only: %i[ show edit update destroy ]

  # GET /programme_courses or /programme_courses.json
  def index
    @programme_courses = ProgrammeCourse.all
  end

  # GET /programme_courses/1 or /programme_courses/1.json
  def show
  end

  # GET /programme_courses/new
  def new
    @programmes = ProgrammeCourse.all
    @programme_course = ProgrammeCourse.new
    @courses = Course.all
    @programme_code = params[:programme_code]
  end


  # GET /programme_courses/1/edit
  def edit
  end

  # POST /programme_courses or /programme_courses.json
  def create
    @programme_code = params[:programme_code]
    @programme_course = ProgrammeCourse.new(programme_course_params)

    respond_to do |format|
      if @programme_course.save
        format.html { redirect_to @programme_course, notice: "Programme course was successfully created." }
        format.json { render :show, status: :created, location: @programme_course }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @programme_course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /programme_courses/1 or /programme_courses/1.json
  def update
    respond_to do |format|
      if @programme_course.update(programme_course_params)
        format.html { redirect_to @programme_course, notice: "Programme course was successfully updated." }
        format.json { render :show, status: :ok, location: @programme_course }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @programme_course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /programme_courses/1 or /programme_courses/1.json
  def destroy
    @programme_course.destroy
    respond_to do |format|
      format.html { redirect_to programmes_url, notice: "Programme course was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_programme_course
      @programme_course = ProgrammeCourse.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def programme_course_params
      params.require(:programme_course).permit(:programme_id, :course_id)
    end
end
