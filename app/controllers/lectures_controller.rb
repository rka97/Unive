class LecturesController < ApplicationController
    
    def new
        @lecture = Lecture.new
        @course = Course.find(params[:course])
        @teachers = @course.teachers
        if (!current_user.admin?)
            @teachers = Array(@course.teachers.find(current_user.profile_owner.id))
        end
    end

    def show
        @lecture = Lecture.find(params[:id])
    end

    def create
        @lecture = Lecture.new(lecture_params)
        if @lecture.save
            flash[:success] =  "Lecture added to " + @lecture.course.code
            redirect_to @lecture
        else
            redirect_back fallback_location: courses_url
        end
    end
    
    def edit
        @lecture = Lecture.find(params[:id])
        @course = @lecture.course
        @teachers = @course.teachers
        if (!current_user.admin?)
            @teachers = Array(@course.teachers.find(current_user.profile_owner.id))
        end
        check_lecture_ownership(@lecture)
    end

    def update
        @lecture = Lecture.find(params[:id])
        check_lecture_ownership(@lecture)
        if @lecture.update_attributes(lecture_params)
            flash[:success] = "Lecture data updated"
            redirect_back fallback_location: courses_url
        else
            render 'edit'
        end
    end

    def destroy
        @lecture = Lecture.find(params[:id])
        check_lecture_ownership(@lecture)
        @lecture.destroy
        flash[:success] = "Lecture removed from course"
        redirect_back fallback_location: courses_url
    end

    
    private
    def lecture_params
        params.require(:lecture).permit(:id, :place, :lec_time, :note, :teacher_id, :course_id)
    end
    def check_lecture_ownership(lecture)
        if !(current_user.admin? || (current_user.profile_owner_type == "Teacher" && lecture.teacher == current_user.profile_owner))
            redirect_back fallback_location: courses_url
        end
    end
end
