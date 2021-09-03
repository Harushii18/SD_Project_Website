class SiteFacilitatorsController < ApplicationController
  before_action :set_site_facilitator, only: %i[ show edit update destroy ]

  # GET /site_facilitators or /site_facilitators.json
  def index
    @site_facilitators = SiteFacilitator.all
  end

  # GET /site_facilitators/1 or /site_facilitators/1.json
  def show
  end

  # GET /site_facilitators/new
  def new
    @site_facilitator = SiteFacilitator.new
  end

  # GET /site_facilitators/1/edit
  def edit
  end

  # POST /site_facilitators or /site_facilitators.json
  def create
    @site_facilitator = SiteFacilitator.new(site_facilitator_params)

    respond_to do |format|
      if @site_facilitator.save
        format.html { redirect_to @site_facilitator, notice: "Site facilitator was successfully created." }
        format.json { render :show, status: :created, location: @site_facilitator }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @site_facilitator.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /site_facilitators/1 or /site_facilitators/1.json
  def update
    respond_to do |format|
      if @site_facilitator.update(site_facilitator_params)
        format.html { redirect_to @site_facilitator, notice: "Site facilitator was successfully updated." }
        format.json { render :show, status: :ok, location: @site_facilitator }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @site_facilitator.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /site_facilitators/1 or /site_facilitators/1.json
  def destroy
    @site_facilitator.destroy
    respond_to do |format|
      format.html { redirect_to site_facilitators_url, notice: "Site facilitator was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_site_facilitator
      @site_facilitator = SiteFacilitator.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def site_facilitator_params
      params.require(:site_facilitator).permit(:Site_Facilitator_Name, :Site_Facilitator_ContactNo, :Site_Facilitator_Email)
    end
end
