class TeacherCoursesController < ApplicationController
    before_action :redirect_if_not_admin, only: [:index, :edit, :update, :destroy] 

    def new
        @teachercourse = TeacherCourse.new
        @course = Course.find(params[:course])
        teachers_to_add = Teacher.all.reject{|x| @course.teachers.include? x }
        @teachers = teachers_to_add.collect {|t| [ t.name + " | " + t.id.to_s, t.id ]}
    end

    def create
        @teachercourse = TeacherCourse.new(teacher_course_params)
        if @teachercourse.save
            flash[:success] = @teachercourse.teacher.name + " now teaches " + @teachercourse.course.code
            redirect_back fallback_location: courses_url
        else
            redirect_back fallback_location: courses_url
        end
    end
    
    def edit
        @teachercourse = TeacherCourse.find(params[:id])
        @teacher = @teachercourse.teacher
    end

    def update
        @teachercourse = TeacherCourse.find(params[:id])
        if @teachercourse.update_attributes(teacher_course_params)
            flash[:success] = "Teacher data updated"
            redirect_back fallback_location: courses_url
        else
            render 'edit'
        end
    end

    def destroy
        TeacherCourse.find(params[:id]).destroy
        flash[:success] = "Teacher removed from course"
        redirect_back fallback_location: courses_url
    end

    private
    def teacher_course_params
        params.require(:teacher_course).permit(:id, :date_taught, :course_id, :teacher_id)
    end
end
