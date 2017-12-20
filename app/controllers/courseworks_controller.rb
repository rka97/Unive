class CourseworksController < ApplicationController
    before_action :redirect_if_not_admin, only: [:index, :edit, :update, :destroy] 

    def new
        @coursework = Coursework.new
        @course = Course.find(params[:course])
    end

    def index
        @coureswork= Courseworks.ransack(params[:id]
        

    end

    def show
        @coursework = Coursework.find(params[:id])
        @q = @coursework.student_courseworks.ransack(params[:q])
        @student_courseworks = @q.result(distinct: true).paginate(page: params[:student_cws_page], per_page: 5)
    end

    def create
        @coursework = Coursework.new(coursework_params)
        if @coursework.save
            flash[:success] = @coursework.title + " added to " + @coursework.course.code
            redirect_back fallback_location: courses_url
        else
            redirect_back fallback_location: courses_url
        end
    end
    
    def edit
        @coursework = Coursework.find(params[:id])
        @course = @coursework.course
    end

    def update
        @coursework = Coursework.find(params[:id])
        if @coursework.update_attributes(coursework_params)
            flash[:success] = "Coursework data updated"
            redirect_back fallback_location: courses_url
        else
            render 'edit'
        end
    end

    def destroy
        Coursework.find(params[:id]).destroy
        flash[:success] = "Coursework removed from course"
        redirect_back fallback_location: courses_url
    end

    
    private
    def coursework_params
        params.require(:coursework).permit(:id, :date_due, :date_assigned, :description, :weight, :total_mark, :title, :course_id)
    end
end
