class StudentCourseEnrollmentsUniqueness < ActiveRecord::Migration[5.1]
  def change
    add_index :student_course_enrollments, [:course_id, :student_id], unique: true
  end
end
