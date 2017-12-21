class AddSolutionToStudentCourseworks < ActiveRecord::Migration[5.1]
  def change
    add_column :student_courseworks, :solution, :string
  end
end
