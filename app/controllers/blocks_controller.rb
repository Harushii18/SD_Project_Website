class BlocksController < ApplicationController
	before_action :authenticate_admin! #kameron: definition found in application_controller.rb
  before_action :set_block, only: %i[ show edit update destroy ]
  require "csv"

  # GET /blocks or /blocks.json
  def index
    @blocks = Block.all
  end

  # GET /blocks/1 or /blocks/1.json
  def show
  end

  # GET /blocks/new
  def new
    @block = Block.new
  end

  # GET /blocks/1/edit
  def edit
  end

  # POST /blocks or /blocks.json
  def create
    @block = Block.new(block_params)
      if ( @block[:BlockStartDate] < @block[:BlockEndDate]) #checks if the block dates make sense
        respond_to do |format|
          if @block.save
            format.html { redirect_to @block, notice: "Block was successfully created." }
            format.json { render :show, status: :created, location: @block }
          else
            format.html { render :new, status: :unprocessable_entity }
            format.json { render json: @block.errors, status: :unprocessable_entity }
          end
        end

      else#START Showing alert message for invalid block dates---------------------------------------------------------------------------------------------------------------------------------------------------
        flash.now[:alert] = "Block Start Date cannot be after the Block End Date. Please choose a Block Start Date that is earlier than the Block End Date"
        respond_to do |format|
            format.html { render :new, status: :unprocessable_entity }
            format.json { render json: @block.errors, status: :unprocessable_entity }
        end
      end#END Showing alert message for invalid block dates---------------------------------------------------------------------------------------------------------------------------------------------------

  end

  # PATCH/PUT /blocks/1 or /blocks/1.json
  def update
    @tempblock = Block.new(block_params)
    if ( @tempblock[:BlockStartDate] < @tempblock[:BlockEndDate]) #checks if the block dates make sense
      respond_to do |format|
        if @block.update(block_params)
          format.html { redirect_to @block, notice: "Block was successfully updated." }
          format.json { render :show, status: :ok, location: @block }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @block.errors, status: :unprocessable_entity }
        end
      end
    else#START Showing alert message for invalid block dates----------------------------------------------------------------------------------------------------------------------------------------------
      flash.now[:alert] = "Block Start Date cannot be after the Block End Date. Please choose a Block Start Date that is earlier than the Block End Date"
      respond_to do |format|
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @block.errors, status: :unprocessable_entity }
      end

    end#END Showing alert message for invalid block dates---------------------------------------------------------------------------------------------------------------------------------------------------
  end

  # DELETE /blocks/1 or /blocks/1.json
  def destroy

    @block.destroy
    respond_to do |format|
      format.html { redirect_to blocks_url, notice: "Block was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def import #importing from csv file
    Block.import(params[:file])
    redirect_to blocks_path, notice: "Blocks Added Successfully"
  end

  def upload
    uploaded_file = params[:file]
    File.open(Rails.root.join('public', 'uploads', uploaded_file.original_filename), 'wb') do |file|
      file.write(uploaded_file.read)
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_block
      @block = Block.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def block_params
      params.require(:block).permit(:BlockStartDate, :BlockEndDate)
    end
end
