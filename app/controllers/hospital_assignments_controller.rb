class HospitalAssignmentsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_hospital_assignment, only: %i[ show edit update destroy ]

  # GET /hospital_assignments or /hospital_assignments.json
  def index
    @hospital_assignments = HospitalAssignment.all

  end

  # GET /hospital_assignments/1 or /hospital_assignments/1.json
  def show
  end

  # GET /hospital_assignments/new
  def new
    @hospital_assignment = HospitalAssignment.new
  end

  # GET /hospital_assignments/1/edit
  def edit
  end

  # POST /hospital_assignments or /hospital_assignments.json
  def create
    @hospital_assignment = HospitalAssignment.new(hospital_assignment_params)
    if  @hospital_assignment.user.user_Type != "Student"
      redirect_to new_hospital_assignment_path, notice: "User is not a Student"
    else
      respond_to do |format|
        if @hospital_assignment.save
          format.html { redirect_to @hospital_assignment, notice: "Hospital assignment was successfully created." }
          format.json { render :show, status: :created, location: @hospital_assignment }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @hospital_assignment.errors, status: :unprocessable_entity }
        end
      end
    end

  end

  # PATCH/PUT /hospital_assignments/1 or /hospital_assignments/1.json
  def update
    respond_to do |format|
      if @hospital_assignment.update(hospital_assignment_params)
        format.html { redirect_to @hospital_assignment, notice: "Hospital assignment was successfully updated." }
        format.json { render :show, status: :ok, location: @hospital_assignment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @hospital_assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hospital_assignments/1 or /hospital_assignments/1.json
  def destroy
    @hospital_assignment.destroy
    respond_to do |format|
      format.html { redirect_to hospital_assignments_url, notice: "Hospital assignment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hospital_assignment
      @hospital_assignment = HospitalAssignment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def hospital_assignment_params
      params.require(:hospital_assignment).permit(:user_id, :block_id, :hospital_id)
    end
end
