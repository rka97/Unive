class StudentCoursesController < ApplicationController
  before_action :redirect_if_not_student, only: [:index, :edit, :update, :destroy]

  def index
    @courses = (@current_user.profile_owner).courses
  end

end
