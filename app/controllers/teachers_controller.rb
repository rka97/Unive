class TeachersController < ApplicationController
  before_action :redirect_if_not_admin, only: [:index, :edit, :update, :destroy] 
  
  def index
  end
end
