class CourseNotesController < ApplicationController
    before_action :redirect_if_not_admin, only: [:index, :edit, :update, :destroy] 

    def new
        @coursenote = CourseNote.new
        @course = Course.find(params[:course])
    end

    def show
        @coursenote = CourseNote.find(params[:id])
    end

    def create
        @coursenote = CourseNote.new(coursenote_params)
        if @coursenote.save
            flash[:success] = @coursenote.title + " added to " + @coursenote.course.code
            redirect_back fallback_location: courses_url
        else
            redirect_back fallback_location: courses_url
        end
    end
    
    def edit
        @coursenote = CourseNote.find(params[:id])
        @course = @coursenote.course
    end

    def update
        @coursenote = CourseNote.find(params[:id])
        if @coursenote.update_attributes(coursenote_params)
            flash[:success] = "Course Note data updated"
            redirect_back fallback_location: courses_url
        else
            render 'edit'
        end
    end

    def destroy
        CourseNote.find(params[:id]).destroy
        flash[:success] = "Course Note removed from course"
        redirect_back fallback_location: courses_url
    end

    
    private
    def coursenote_params
        params.require(:course_note).permit(:id, :title, :content, :course_id)
    end
end
