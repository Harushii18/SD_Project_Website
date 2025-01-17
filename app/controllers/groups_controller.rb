class GroupsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_group, only: %i[ show edit update destroy ]

  # GET /groups or /groups.json
  def index

    @programmes = Programme.all
    @FirstRec = Programme.first;
    @Groups = Group.all; #buggy -> doesnt update on first click (so filter on reload)
    if (@FirstRec != nil)
      
      @current_programme_id = @FirstRec.id;
      if (params[:programme_id])
        @current_programme_id =  params[:programme_id];
        @Groups = Group.where(programme_id: @current_programme_id);
      end
    end

  end

  # GET /groups/1 or /groups/1.json
  def show
  end

  def _form
    @programmes = Programme.all
  end

  # GET /groups/new
  def new
    @group = Group.new
    @programmes = Programme.all
  end

  # GET /groups/1/edit
  def edit
  end

  # POST /groups or /groups.json
  def create
    @group = Group.new(group_params)

    respond_to do |format|
      if @group.save
        format.html { redirect_to @group, notice: "Group was successfully created." }
        format.json { render :show, status: :created, location: @group }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /groups/1 or /groups/1.json
  def update
    respond_to do |format|
      if @group.update(group_params)
        format.html { redirect_to @group, notice: "Group was successfully updated." }
        format.json { render :show, status: :ok, location: @group }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /groups/1 or /groups/1.json
  def destroy
    @group.destroy
    respond_to do |format|
      format.html { redirect_to groups_url, notice: "Group was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group
      @group = Group.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def group_params
      params.require(:group).permit(:programme_id, :group_name)
    end
end
