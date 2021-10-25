class GroupAssignmentsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_group_assignment, only: %i[ show edit update destroy ]

  # GET /group_assignments or /group_assignments.json
  def index
    #search code
    @q = GroupAssignment.ransack(params[:q])
    @group_assignments = @q.result
  end

  # GET /group_assignments/1 or /group_assignments/1.json
  def show
  end

  # GET /group_assignments/new
  def new
    @group_assignment = GroupAssignment.new
    @group_id = params[:group_id]
  end

  # GET /group_assignments/1/edit
  def edit
  end

  # POST /group_assignments or /group_assignments.json
  def create
    @group_assignment = GroupAssignment.new(group_assignment_params)

    respond_to do |format|
      if @group_assignment.save
        format.html { redirect_to @group_assignment, notice: "Group assignment was successfully created." }
        format.json { render :show, status: :created, location: @group_assignment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @group_assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /group_assignments/1 or /group_assignments/1.json
  def update
    respond_to do |format|
      if @group_assignment.update(group_assignment_params)
        format.html { redirect_to @group_assignment, notice: "Group assignment was successfully updated." }
        format.json { render :show, status: :ok, location: @group_assignment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @group_assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /group_assignments/1 or /group_assignments/1.json
  def destroy
    @group_assignment.destroy
    respond_to do |format|
      format.html { redirect_to group_assignments_url, notice: "Group assignment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group_assignment
      @group_assignment = GroupAssignment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def group_assignment_params
      params.require(:group_assignment).permit(:group_id, :StudentID, :GroupYear)
    end
end
