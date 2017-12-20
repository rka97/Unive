class CoursesController < ApplicationController
    before_action :redirect_if_not_admin, only: [:index, :edit, :update, :destroy] 
    before_action:redirect_if_teacher,only: [:index]    
    
    def show
        @course = Course.find(params[:id])
        @q = @course.students.ransack(params[:q])
        @students = @q.result(distinct: true).paginate(page: params[:students_page], per_page: 5)
        @ts = (@course.teachers).ransack(params[:q])
        @teachers = @ts.result(distinct: true).paginate(page: params[:teachers_page], per_page: 5)
        @cws = (@course.courseworks).ransack(params[:q])
        @courseworks = @cws.result(distinct: true).paginate(page: params[:courseworks_page], per_page: 5)
        @cns = (@course.course_notes).ransack(params[:q])
        @coursenotes = @cns.result(distinct: true).paginate(page: params[:coursenotes_page], per_page: 5)
        @lcs = (@course.lectures).ransack(params[:q])
        @lectures = @lcs.result(distinct: true).paginate(page: params[:lectures_page], per_page: 5)
    end
    
    def new
        @course = Course.new
    end
    
    def create
        @course = Course.new(course_params)
        if @course.save
            flash[:success] = "Course Added."
            redirect_to @course
        else
            render 'new'
        end
    end
    
    def index
        @q = Course.ransack(params[:q])
        @courses = @q.result(distinct: true).paginate(page: params[:page])
    end
    
    def edit
        @course = Course.find(params[:id])
    end
    
    def update
        @course = Course.find(params[:id])
        if @course.update_attributes(course_params)
            flash[:success] = "Course data updated"
            redirect_to @course
        else
            render 'edit'
        end
        end
    
    def destroy
        Course.find(params[:id]).destroy
        flash[:success] = "Course deleted"
        redirect_to courses_url
    end
    
    private
    def course_params
        params.require(:course).permit(:id, :code, :title, :credit_hours, :total_mark, :department_id)
    end
end
