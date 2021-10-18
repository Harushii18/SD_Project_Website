class StudentDashboardController < ApplicationController
  before_action :authenticate_admin! #definition found in application_controller.rb
  def index
  end

end
