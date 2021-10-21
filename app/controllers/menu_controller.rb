class MenuController < ApplicationController
  before_action :authenticate_admin! #kameron: definition found in application_controller.rb
  def index
  end

end
