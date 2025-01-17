class ProgrammesController < ApplicationController

before_action :authenticate_admin! #kameron: definition found in application_controller.rb
  before_action :set_programme, only: %i[ show edit update destroy ]
  before_action :set_search

  # GET /programmes or /programmes.json

  def index
    @programmes = @q.result
    @programmecourses = ProgrammeCourse.all
    @courses = Course.all

  end

  def set_search
    @q=Programme.ransack(params[:q])
  end

  # GET /programmes/1 or /programmes/1.json
  def show
    @programmecourses = ProgrammeCourse.all
    @courses = Course.all
  end

  # GET /programmes/new
  def new
    @programme = Programme.new
  end

  # GET /programmes/1/edit
  def edit
  end

  # POST /programmes or /programmes.json
  def create
    @programme = Programme.new(programme_params)

    respond_to do |format|
      if @programme.save
        format.html { redirect_to @programme, notice: "Programme was successfully created." }
        format.json { render :show, status: :created, location: @programme }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @programme.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /programmes/1 or /programmes/1.json
  def update
    respond_to do |format|
      if @programme.update(programme_params)
        format.html { redirect_to @programme, notice: "Programme was successfully updated." }
        format.json { render :show, status: :ok, location: @programme }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @programme.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /programmes/1 or /programmes/1.json
  def destroy
    #START deletion of groups--------------------------------------------------------------------
    #perform deletion of groups via the groups scaffold before deletion to server for the programme is called
    @groups = Group.where({programme_id: [@programme.id]})

    @groups.each do |group|
      group.destroy
    end
    #END deletion of groups--------------------------------------------------------------------
    
    @programme.destroy
    respond_to do |format|
      format.html { redirect_to programmes_url, notice: "Programme was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_programme
      @programme = Programme.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def programme_params
      params.require(:programme).permit(:programme_code)
    end
end
