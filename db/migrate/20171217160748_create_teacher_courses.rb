class CreateTeacherCourses < ActiveRecord::Migration[5.1]
  def change
    create_table :teacher_courses do |t|
      t.belongs_to :course, index: true, optional: false
      t.belongs_to :teacher, index: true, optional: false
      t.timestamps
    end
  end
end
