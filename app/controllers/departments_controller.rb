class DepartmentsController < ApplicationController
    before_action :redirect_if_not_admin, only: [:index, :edit, :update, :destroy] 
    
    def show
        @department = Department.find(params[:id])
        @q = (@department.students).ransack(params[:q])
        @students = @q.result(distinct: true).paginate(page: params[:students_page], per_page: 5)
        @qteachers = (@department.teachers).ransack(params[:q])
        @teachers = @qteachers.result(distinct: true).paginate(page: params[:teachers_page], per_page: 5)
    end
  
    def new
        @department = Department.new
    end
  
    def create
        @department = Department.new(department_params)
        if @department.save
          flash[:success] = "Department Added."
          redirect_to @department
        else
          render 'new'
        end
    end
  
    def index
        @q = Department.ransack(params[:q])
        @departments = @q.result(distinct: true).paginate(page: params[:page])
    end
  
    def edit
        @department = Department.find(params[:id])
    end
  
    def update
        @department = Department.find(params[:id])
        if @department.update_attributes(department_params)
          flash[:success] = "Department data updated"
          redirect_to @department
        else
          render 'edit'
        end
      end
  
    def destroy
        Department.find(params[:id]).destroy
        flash[:success] = "Department deleted"
        redirect_to departments_url
    end
  
    private
    def department_params
        params.require(:department).permit(:id, :name, :abbreviation)
    end
end