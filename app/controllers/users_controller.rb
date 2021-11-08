class UsersController < ApplicationController
  before_action :authenticate_admin! #definition found in application_controller.rb
  before_action :set_user, only: %i[ show edit update destroy ]
  before_action :set_search
  #before_action :set_student, only: %i[ show edit update destroy ]
  require "csv"

  # GET /students or /students.json

  def index
   # @students = Student.all
    @users = @q.result
  end


  def set_search
    @q=User.ransack(params[:q])
  end

  # GET /users/1 or /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
    @types =  ["Admin","Student","Registrar","Consultant"]
   # @currentType = User.find(params[:id]).user_Type
    @mode = "new"
  end

  # GET /users/1/edit
  def edit
    @types =  ["Admin","Student","Registrar","Consultant"]
    @currentType = User.find(params[:id]).user_Type
    @mode = "edit"
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: "User was successfully created." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update

    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy


    #START deletion of student--------------------------------------------------------------------
    #perform deletion of groups via the groups scaffold before deletion to server for the programme is called
    @students = Student.where({user_id: [@user.id]})

    @students.each do |student|
      student.destroy
    end
    #END deletion of students--------------------------------------------------------------------
    
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def import # importing from csv file
    User.import(params[:file]) #call User.import function in user.rb model file
    redirect_to users_path, notice: "Users Added Successfully"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:email, :user_FirstName, :user_LastName, :password, :user_ContactNo, :user_Type)
    end
end
