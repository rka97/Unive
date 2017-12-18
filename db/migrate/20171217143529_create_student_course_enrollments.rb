class CreateStudentCourseEnrollments < ActiveRecord::Migration[5.1]
  def change
    create_table :student_course_enrollments do |t|
      t.string :status, null: false
      t.belongs_to :course, index: true, optional: false
      t.belongs_to :student, index: true, optional: false

      t.timestamps
    end
  end
end
