class TeacherCoursesController < ApplicationController
    before_action :redirect_if_not_admin, only: [:index, :edit, :update, :destroy] 

    def destroy
        TeacherCourse.find(params[:id]).destroy
        flash[:success] = "Teacher removed from course"
        redirect_back fallback_location: courses_url
    end
end
