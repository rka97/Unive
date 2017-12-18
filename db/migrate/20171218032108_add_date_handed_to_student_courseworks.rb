class AddDateHandedToStudentCourseworks < ActiveRecord::Migration[5.1]
  def change
    add_column :student_courseworks, :date_handed, :date, null: false, default: '11-11-2017'
  end
end
