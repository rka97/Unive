class StudentsController < ApplicationController
    before_action :redirect_if_not_admin, only: [:index, :edit, :update, :destroy] 
    def index
        @students = Student.paginate(page: params[:page])
    end
end
