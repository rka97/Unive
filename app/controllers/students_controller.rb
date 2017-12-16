class StudentsController < ApplicationController
    before_action :redirect_if_not_admin, only: [:index, :edit, :update, :destroy] 

    def show
        @student = Student.find(params[:id])
    end

    def index
        @q = Student.ransack(params[:q])
        @students = @q.result(distinct: true).paginate(page: params[:page])
    end

    def edit
        @student = Student.find(params[:id])
    end

    def update
        @student = Student.find(params[:id])
        if @student.update_attributes(student_params)
          flash[:success] = "Student data updated"
          redirect_to @student
        else
          render 'edit'
        end
      end
    
    def destroy
        Student.find(params[:id]).destroy
        flash[:success] = "Student deleted"
        redirect_to students_url
    end

    private
    def student_params
        params.require(:student).permit(:name, :section_number, :bench_number, :gender, :year, :phone_number, :address, :birth_date, :search)
    end
end
