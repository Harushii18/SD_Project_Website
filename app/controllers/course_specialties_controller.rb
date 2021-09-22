class CourseSpecialtiesController < ApplicationController
  before_action :set_course_specialty, only: %i[ show edit update destroy ]

  # GET /course_specialties or /course_specialties.json
  def index
    @course_specialties = CourseSpecialty.all
  end

  # GET /course_specialties/1 or /course_specialties/1.json
  def show
  end

  # GET /course_specialties/new
  def new
    @course_specialty = CourseSpecialty.new
    @course_id = params[:course_id]
  end

  # GET /course_specialties/1/edit
  def edit
  end

  # POST /course_specialties or /course_specialties.json
  def create
    @course_specialty = CourseSpecialty.new(course_specialty_params)
    @course_id = params[:course_id]
    respond_to do |format|
      if @course_specialty.save
        format.html { redirect_to @course_specialty, notice: "Course specialty was successfully created." }
        format.json { render :show, status: :created, location: @course_specialty }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @course_specialty.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /course_specialties/1 or /course_specialties/1.json
  def update
    respond_to do |format|
      if @course_specialty.update(course_specialty_params)
        format.html { redirect_to @course_specialty, notice: "Course specialty was successfully updated." }
        format.json { render :show, status: :ok, location: @course_specialty }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @course_specialty.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /course_specialties/1 or /course_specialties/1.json
  def destroy
    @course_specialty.destroy
    respond_to do |format|
      format.html { redirect_to courses_url, notice: "Course specialty was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course_specialty
      @course_specialty = CourseSpecialty.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def course_specialty_params
      params.require(:course_specialty).permit(:course_id, :specialty_id, :weeks)
    end
end
