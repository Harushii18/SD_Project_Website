class SpecialtyPagesController < ApplicationController
  before_action :authenticate_admin! #definition found in application_controller.rb
  before_action :set_specialty_page, only: %i[ show edit update destroy ]

  # GET /specialty_pages or /specialty_pages.json
  def index
    @specialty_pages = SpecialtyPage.all
  end


  # GET /specialty_pages/1 or /specialty_pages/1.json
  def show
  end
  # GET /specialty_pages/new
  def new
    @specialty_page = SpecialtyPage.new
  end

  # GET /specialty_pages/1/edit
  def edit
  end

  # POST /specialty_pages or /specialty_pages.json
  def create
    @specialty_page = SpecialtyPage.new(specialty_page_params)

    respond_to do |format|
      if @specialty_page.save
        format.html { redirect_to @specialty_page, notice: "Specialty page was successfully created." }
        format.json { render :show, status: :created, location: @specialty_page }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @specialty_page.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /specialty_pages/1 or /specialty_pages/1.json
  def update
    respond_to do |format|
      if @specialty_page.update(specialty_page_params)
        format.html { redirect_to @specialty_page, notice: "Specialty page was successfully updated." }
        format.json { render :show, status: :ok, location: @specialty_page }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @specialty_page.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /specialty_pages/1 or /specialty_pages/1.json
  def destroy
    @specialty_page.destroy
    respond_to do |format|
      format.html { redirect_to specialty_pages_url, notice: "Specialty page was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_specialty_page
      @specialty_page = SpecialtyPage.find(params[:ID]) rescue nil
    end

    # Only allow a list of trusted parameters through.
    def specialty_page_params
      params.require(:specialty_page).permit(:specialty_ID, :specialty_name)
    end
end
