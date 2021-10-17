class RotationsController < ApplicationController
	before_action :authenticate_admin! #kameron: definition found in application_controller.rb
  before_action :set_rotation, only: %i[ show edit update destroy ]
  require "csv"

  # GET /rotations or /rotations.json
  def index
    @rotations = Rotation.all
  end

  # GET /rotations/1 or /rotations/1.json
  def show
  end

  # GET /rotations/new
  def new
    @rotation = Rotation.new
  end

  # GET /rotations/1/edit
  def edit
  end

  # POST /rotations or /rotations.json
  def create
    @rotation = Rotation.new(rotation_params)
      if ( @rotation[:startDate] < @rotation[:endDate]) #checks if the rotation dates make sense
        respond_to do |format|
          if @rotation.save
            format.html { redirect_to @rotation, notice: "Rotation was successfully created." }
            format.json { render :show, status: :created, location: @rotation }
          else
            format.html { render :new, status: :unprocessable_entity }
            format.json { render json: @rotation.errors, status: :unprocessable_entity }
          end
        end

      else#START Showing alert message for invalid rotation dates---------------------------------------------------------------------------------------------------------------------------------------------------
        flash.now[:alert] = "Rotation Start Date cannot be after the Rotation End Date. Please choose a Rotation Start Date that is earlier than the Rotation End Date"
        respond_to do |format|
            format.html { render :new, status: :unprocessable_entity }
            format.json { render json: @rotation.errors, status: :unprocessable_entity }
        end
      end#END Showing alert message for invalid rotation dates---------------------------------------------------------------------------------------------------------------------------------------------------

  end

  # PATCH/PUT /rotations/1 or /rotations/1.json
  def update
    @temprotation = Rotation.new(rotation_params)
    if ( @temprotation[:startDate] < @temprotation[:endDate]) #checks if the rotation dates make sense
      respond_to do |format|
        if @rotation.update(rotation_params)
          format.html { redirect_to @rotation, notice: "Rotation was successfully updated." }
          format.json { render :show, status: :ok, location: @rotation }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @rotation.errors, status: :unprocessable_entity }
        end
      end
    else#START Showing alert message for invalid rotation dates----------------------------------------------------------------------------------------------------------------------------------------------
      flash.now[:alert] = "Rotation Start Date cannot be after the Rotation End Data. Please choose a Rotation Start Date that is eariler than the Rotation End Date"
      respond_to do |format|
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @rotation.errors, status: :unprocessable_entity }
      end

    end#END Showing alert message for invalid rotation dates---------------------------------------------------------------------------------------------------------------------------------------------------
  end

  # DELETE /rotations/1 or /rotations/1.json
  def destroy

    @rotation.destroy
    respond_to do |format|
      format.html { redirect_to rotations_url, notice: "Rotation was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def import #importing from csv file
    Rotation.import(params[:file])
    redirect_to rotations_path, notice: "Rotations Added Successfully"
  end

  def upload
    uploaded_file = params[:file]
    File.open(Rails.root.join('public', 'uploads', uploaded_file.original_filename), 'wb') do |file|
      file.write(uploaded_file.read)
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rotation
      @rotation = Rotation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def rotation_params
      params.require(:rotation).permit(:startDate, :endDate, :programme_id)
    end
end
