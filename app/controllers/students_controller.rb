class StudentsController < ApplicationController
    before_action :redirect_if_not_admin, only: [:index, :edit, :update, :destroy] 

    def index
        @students = Student.paginate(page: params[:page])
    end

    def destroy
        Student.find(params[:id]).destroy
        flash[:success] = "Student deleted"
        redirect_to students_url
    end
end
