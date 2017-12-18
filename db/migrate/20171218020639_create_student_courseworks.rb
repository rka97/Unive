class CreateStudentCourseworks < ActiveRecord::Migration[5.1]
  def change
    create_table :student_courseworks do |t|
      t.float :mark, null: false
      t.belongs_to :coursework, optional: false
      t.belongs_to :course, optional: false
      t.belongs_to :student, optional: false
      t.timestamps
    end
    add_index :student_courseworks, [:coursework_id, :course_id, :student_id], name: 'index_scw_on_cw_and_c_and_s', unique: true
  end
end
