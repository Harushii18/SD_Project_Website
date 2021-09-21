class SchedulesController < ApplicationController
  skip_forgery_protection
  before_action :set_schedule, only: %i[ show edit update destroy ]
  before_action :set_search


  # GET /schedules or /schedules.json
  def index
    @users = @q.result
    @programmes = Programme.all


    @specialties = Specialty.all
    puts("look here")
    @current_programme_id = 1

    if (params[:programme_id])
        @current_programme_id =  params[:programme_id]
    #else
    end


    @programme_courses = ProgrammeCourse.where(programme_id: @current_programme_id).select([:course_id])

    @course_specialties = CourseSpecialty.where(course_id: @programme_courses).select([:specialty_id])

    @specialties = Specialty.where(id: @course_specialties)



    @students = Student.filter_by_programme_id(@current_programme_id)
    #@students = @students.find()
    @schedules = Schedule.all

    @rotations = Rotation.filter_by_programme_id(@current_programme_id)

    @numRotations = @rotations.length()
  end

   def set_search
     @q=User.ransack(params[:q])
   end




  # GET /schedules/1 or /schedules/1.json
  def show
  end

  # GET /schedules/new
  def new
    @schedule = Schedule.new
  end

  # GET /schedules/1/edit
  def edit
  end

  # POST /schedules or /schedules.json
  def create
    @schedule = Schedule.new(schedule_params)
    respond_to do |format|
      if @schedule.save
        format.html { redirect_to @schedule, notice: "Schedule was successfully created." }
        format.json { render :show, status: :created, location: @schedule }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /schedules/1 or /schedules/1.json
  def update
    respond_to do |format|
      if @schedule.update(schedule_params)
        format.html { redirect_to @schedule, notice: "Schedule was successfully updated." }
        format.json { render :show, status: :ok, location: @schedule }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /schedules/1 or /schedules/1.json
  def destroy
    @schedule.destroy
    respond_to do |format|
      format.html { redirect_to schedules_url, notice: "Schedule was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def create_schedule

    if (params[:specialty_id]!='' && params[:hospital_id]!='')
      if Schedule.exists?(student_id: params[:student_id], rotation_id: params[:rotation_id])
        Schedule.update_with_form_data(params[:student_id], params[:rotation_id], params[:specialty_id], params[:hospital_id])
      else
        Schedule.create_with_form_data(params[:student_id], params[:rotation_id], params[:specialty_id], params[:hospital_id])
      end
    end

  end

  def update_schedule
    if (params[:specialty_id]!='' && params[:hospital_id]!='')
    Schedule.update_with_form_data(params[:student_id], params[:rotation_id], params[:specialty_id], params[:hospital_id])
    end
  end




  #def import # importing from csv file
  #  User.import(params[:file]) #call User.import function in user.rb model file
  #  redirect_to users_path, notice: "Users Added Successfully"
  #end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_schedule
      @schedule = Schedule.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def schedule_params
      params.permit(:student_id, :specialty_id, :rotation_id, :hospital_id)
    end
end
