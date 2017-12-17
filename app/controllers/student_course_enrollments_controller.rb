class StudentCourseEnrollmentsController < ApplicationController
    before_action :redirect_if_not_admin, only: [:index, :edit, :update, :destroy] 

    def new
        @scenrollment = StudentCourseEnrollment.new
    end

    def create
        @scenrollment = StudentCourseEnrollment.new(student_course_enrollment_params)
        if @scenrollment.save
            flash[:success] = @scenrollment.student.name + " is now enrolled in " + @scenrollment.course.name
            redirect_back fallback_location: courses_url
        else
            render 'new'
        end
    end
    
    def edit
        @scenrollment = StudentCourseEnrollment.find(params[:id])
    end

    def update
        @scenrollment = StudentCourseEnrollment.find(params[:id])
        if @scenrollment.update_attributes(student_course_enrollment_params)
            flash[:success] = "Student Enrollment updated"
            redirect_back fallback_location: courses_url
        else
            render 'edit'
        end
    end
  
    def destroy
        StudentCourseEnrollment.find(params[:id]).destroy
        flash[:success] = "Student removed from course"
        redirect_back fallback_location: courses_url
    end


  private
  def student_course_enrollment_params
      params.require(:student_course_enrollment).permit(:id, :status, :course_id, :student_id)
  end
end
