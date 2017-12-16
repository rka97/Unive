class TeachersController < ApplicationController
  before_action :redirect_if_not_admin, only: [:index, :edit, :update, :destroy] 
  
  def show
    @teacher = Teacher.find(params[:id])
  end

  def new
      @teacher = Teacher.new
      @teacher.degrees = [TeacherDegree.new, TeacherDegree.new, TeacherDegree.new]
      @teacher.interests = [TeacherInterest.new, TeacherInterest.new, TeacherInterest.new ]
  end

  def create
      @teacher = Teacher.new(teacher_params)
      if @teacher.save
        flash[:success] = "Teacher Added."
        redirect_to @teacher
      else
        render 'new'
      end
  end

  def index
      @q = Teacher.ransack(params[:q])
      @teachers = @q.result(distinct: true).paginate(page: params[:page])
  end

  def edit
      @teacher = Teacher.find(params[:id])
      if (@teacher.degrees.size < 3)
        (3 - @teacher.degrees.size).times do |i|
            @teacher.degrees << TeacherDegree.new
        end
      end
      if (@teacher.interests.size < 3)
        (3 - @teacher.interests.size).times do |i|
            @teacher.interests << TeacherInterest.new
        end
      end
  end

  def update
      @teacher = Teacher.find(params[:id])
      if @teacher.update_attributes(teacher_params)
        flash[:success] = "Teacher data updated"
        redirect_to @teacher
      else
        render 'edit'
      end
    end

  def destroy
      Teacher.find(params[:id]).destroy
      flash[:success] = "Teacher deleted"
      redirect_to teachers_url
  end

  private
  def teacher_params
      params.require(:teacher).permit(:id, :name, :title, :hiring_date, :department_id, degrees_attributes: [:id, :title, :date_awarded, :university, :field, :_destroy], interests_attributes: [:id, :field, :_destroy])
  end
end
