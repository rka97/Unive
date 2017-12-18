class AddYearTaughtToTeacherCourse < ActiveRecord::Migration[5.1]
  def change
    add_column :teacher_courses, :date_taught, :date, null: false, default: '11-11-2017'
  end
end
