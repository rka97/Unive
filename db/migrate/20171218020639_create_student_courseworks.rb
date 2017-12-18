class CreateStudentCourseworks < ActiveRecord::Migration[5.1]
  def change
    create_table :student_courseworks do |t|
      t.float :mark, null: false
      t.belongs_to :coursework, optional: false
      t.belongs_to :student, optional: false
      t.timestamps
    end
    add_index :student_courseworks, [:coursework_id, :student_id], unique: true
  end
end
