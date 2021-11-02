class AllocationsController < ApplicationController
  before_action :set_allocation, only: %i[ show edit update destroy ]
  before_action :authenticate_admin!

  # GET /allocations or /allocations.json
  def index
    @allocations = Allocation.all
  end

  # GET /allocations/1 or /allocations/1.json
  def show
  end

  # GET /allocations/new
  def new
    @allocation = Allocation.new
  end

  # GET /allocations/1/edit
  def edit
  end

  # POST /allocations or /allocations.json
  def create
    @allocation = Allocation.new(allocation_params)

    # checks that the specialty && hospital combination isn't currently in the db
    @check=Allocation.where(specialty_id:  @allocation[:specialty_id], hospital_id:  @allocation[:hospital_id]).any? 

    if (@check==false && @allocation[:start_date] < @allocation[:end_date] && @allocation[:available_slots] >= @allocation[:used_slots] && @allocation[:available_slots]>0 && @allocation[:used_slots]>=0) #checks if the allocation dates make sense
      respond_to do |format|
        if @allocation.save
          format.html { redirect_to @allocation, notice: "Allocation was successfully created." }
          format.json { render :show, status: :created, location: @allocation }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @allocation.errors, status: :unprocessable_entity }
        end
    end
    else #START Showing alert message for invalid allocation dates---------------------------------------------------------------------------------------------------------------------------------------------------
      if (@allocation[:start_date] > @allocation[:end_date])
        flash.now[:alert] = "Allocation Start Date cannot be after the Allocation End Date. Please choose a Allocation Start Date that is earlier than the Allocation End Date"
      end
      if (@allocation[:available_slots] < @allocation[:used_slots])
        flash.now[:alert] = "There cannot be more used slots than available slots. Please enter a valid amount"
      end 
        respond_to do |format|
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @block.errors, status: :unprocessable_entity }
      end
    end#END Showing alert message for invalid allocation dates---------------------------------------------------------------------------------------------------------------------------------------------------

  end

  # PATCH/PUT /allocations/1 or /allocations/1.json
  def update
    @tempall = Allocation.new(allocation_params)
    # checks that the specialty && hospital combination isn't currently in the db
    @check=Allocation.where(specialty_id:  @tempall[:specialty_id], hospital_id:  @tempall[:hospital_id]).any? 

    if (@check==false && @tempall[:start_date] < @tempall[:end_date] && @tempall[:available_slots] >= @tempall[:used_slots] && @tempall[:available_slots]>0 && @tempall[:used_slots]>=0) #checks if the block dates make sense
      respond_to do |format|
        if @allocation.update(allocation_params)
          format.html { redirect_to @allocation, notice: "Allocation was successfully updated." }
          format.json { render :show, status: :ok, location: @allocation }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @allocation.errors, status: :unprocessable_entity }
        end
      end
    else#START Showing alert message for invalid block dates----------------------------------------------------------------------------------------------------------------------------------------------
      if (@tempall[:start_date] < @tempall[:end_date])
        flash.now[:alert] = "Allocation Start Date cannot be after the Allocation End Date. Please choose a Allocation Start Date that is earlier than the Allocation End Date"
      end
      if (@tempall[:available_slots] > @tempall[:used_slots])
        flash.now[:alert] = "There cannot be more used slots than available slots. Please enter a valid amount"
      end 
      
      respond_to do |format|
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @block.errors, status: :unprocessable_entity }
      end
    end#END Showing alert message for invalid block dates---------------------------------------------------------------------------------------------------------------------------------------------------
  end

  # DELETE /allocations/1 or /allocations/1.json
  def destroy
    @allocation.destroy
    respond_to do |format|
      format.html { redirect_to allocations_url, notice: "Allocation was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_allocation
      @allocation = Allocation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def allocation_params
      params.require(:allocation).permit(:hospital_id, :specialty_id, :available_slots, :used_slots, :start_date, :end_date)
    end
end
