class StudentCourseworksController < ApplicationController
    before_action :redirect_if_not_admin, only: [:index, :edit, :update, :destroy] 

    def new
        @student_coursework = StudentCoursework.new
        @coursework = Coursework.find(params[:coursework])
        students_to_add = (@coursework).course.students.reject{|x| @coursework.students.include? x }
        @students = students_to_add.collect {|s| [ s.name + " | " + s.id.to_s, s.id ]}
    end

    def create
        @student_coursework = StudentCoursework.new(studentcw_params)
        if @student_coursework.save
            flash[:success] = "Successfuly saved " + @student_coursework.student.name + "'s submission."
            redirect_back fallback_location: courses_url
        else
            redirect_back fallback_location: courses_url
        end
    end
    
    def edit
        @student_coursework = StudentCoursework.find(params[:id])
        @coursework = @student_coursework.coursework
    end

    def update
        @student_coursework = StudentCoursework.find(params[:id])
        if @student_coursework.update_attributes(studentcw_params)
            flash[:success] = "Successfuly edited " + @student_coursework.student.name + "'s submission."
            redirect_back fallback_location: courses_url
        else
            render 'edit'
        end
    end

    def destroy
        StudentCoursework.find(params[:id]).destroy
        flash[:success] = "Coursework removed from course"
        redirect_back fallback_location: courses_url
    end

    
    private
    def studentcw_params
        params.require(:student_coursework).permit(:id, :mark, :date_handed, :student_id, :coursework_id)
    end
end
