class LecturesController < ApplicationController
    before_action :redirect_if_not_admin, only: [:index, :edit, :update, :destroy] 

    def new
        @lecture = Lecture.new
        @course = Course.find(params[:course])
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
    end

    def update
        @lecture = Lecture.find(params[:id])
        if @lecture.update_attributes(lecture_params)
            flash[:success] = "Lecture data updated"
            redirect_back fallback_location: courses_url
        else
            render 'edit'
        end
    end

    def destroy
        Lecture.find(params[:id]).destroy
        flash[:success] = "Lecture removed from course"
        redirect_back fallback_location: courses_url
    end

    
    private
    def lecture_params
        params.require(:lecture).permit(:id, :place, :lec_time, :note, :teacher_id, :course_id)
    end
end
