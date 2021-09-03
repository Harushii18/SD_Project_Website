class SiteFacilitatorAllocationsController < ApplicationController
  before_action :set_site_facilitator_allocation, only: %i[ show edit update destroy ]

  # GET /site_facilitator_allocations or /site_facilitator_allocations.json
  def index
    @site_facilitator_allocations = SiteFacilitatorAllocation.all
  end

  # GET /site_facilitator_allocations/1 or /site_facilitator_allocations/1.json
  def show
  end

  # GET /site_facilitator_allocations/new
  def new
    @site_facilitator_allocation = SiteFacilitatorAllocation.new
  end

  # GET /site_facilitator_allocations/1/edit
  def edit
  end

  # POST /site_facilitator_allocations or /site_facilitator_allocations.json
  def create
    @site_facilitator_allocation = SiteFacilitatorAllocation.new(site_facilitator_allocation_params)

    respond_to do |format|
      if @site_facilitator_allocation.save
        format.html { redirect_to @site_facilitator_allocation, notice: "Site facilitator allocation was successfully created." }
        format.json { render :show, status: :created, location: @site_facilitator_allocation }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @site_facilitator_allocation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /site_facilitator_allocations/1 or /site_facilitator_allocations/1.json
  def update
    respond_to do |format|
      if @site_facilitator_allocation.update(site_facilitator_allocation_params)
        format.html { redirect_to @site_facilitator_allocation, notice: "Site facilitator allocation was successfully updated." }
        format.json { render :show, status: :ok, location: @site_facilitator_allocation }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @site_facilitator_allocation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /site_facilitator_allocations/1 or /site_facilitator_allocations/1.json
  def destroy
    @site_facilitator_allocation.destroy
    respond_to do |format|
      format.html { redirect_to site_facilitator_allocations_url, notice: "Site facilitator allocation was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_site_facilitator_allocation
      @site_facilitator_allocation = SiteFacilitatorAllocation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def site_facilitator_allocation_params
      params.require(:site_facilitator_allocation).permit(:hospital_id, :site_facilitator_id)
    end
end
