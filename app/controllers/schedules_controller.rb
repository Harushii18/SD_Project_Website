 class SchedulesController < ApplicationController
  skip_forgery_protection
  before_action :authenticate_admin! #definition found in application_controller.rb
  before_action :set_schedule, only: %i[ show edit update destroy ]
  before_action :set_search


# GET /schedules or /schedules.json
  def index

    @users = @q.result
    @programmes = Programme.all
    @courseSpecialties=CourseSpecialty.all
    @programmCourses=ProgrammeCourse.all
    @all_users = User.all
    @specialties = Specialty.all

    @FirstRec = Programme.first;
    if (@FirstRec != nil)
      @current_programme_id = @FirstRec.id;
      if (params[:programme_id])
        @current_programme_id =  params[:programme_id];
      end
    end

    #to get the group ID
    @value;
    #The Recs in Student_groups based on @value
    @Student_Groups;
    #if the user clicks on groups modal box
    if(params[:Group_id])
      @value = params[:Group_id];
    end

    @Student_Groups = StudentGroup.where(group_id: @value);
    @programme_courses = ProgrammeCourse.where(programme_id: @current_programme_id).select([:course_id])
    @course_specialties = CourseSpecialty.where(course_id: @programme_courses).select([:specialty_id])
    @specialties = Specialty.where(id: @course_specialties)
    @students = Student.filter_by_programme_id(@current_programme_id);

    #Get the Groups Assignment with Prog
    @Groups = Group.where(programme_id: @current_programme_id);

    @schedules = Schedule.all
    @hospitals = Hospital.all
    @hospital_allocations = Allocation.all

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

    if(!Schedule.exists?(student_id:params[:student_id],specialty_id:params[:specialty_id],hospital_id:params[:hospital_id],week_no:params[:week_no],specialty_duration:params[:specialty_duration]))
      respond_to do |format|
        if @schedule.save
          format.json { render :show, status: :created, location: @schedule }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @schedule.errors, status: :unprocessable_entity }
        end
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

  def delete_with_student_id
    Schedule.delete_with_student_id( params[:student_id] ) #calls delete_with_student_id in model schedule.rb
  end

  def delete_with_schedule_id
    Schedule.delete_with_schedule_id( params[:schedule_id] ) #calls delete_with_student_id in model schedule.rb
  end



  # DELETE /schedules/1 or /schedules/1.json
  def destroy
    @schedule.destroy
    respond_to do |format|
      format.html { redirect_to schedules_url, notice: "Schedule was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
    def set_schedule
      @schedule = Schedule.find(params[:id])
    end

  # Only allow a list of trusted parameters through.
    def schedule_params
      params.permit(:student_id, :specialty_id, :hospital_id , :week_no , :specialty_duration)
    end
  end
