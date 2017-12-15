class RemoveDegreeFromStudents < ActiveRecord::Migration[5.1]
  def change
    remove_column :students, :degree
  end
end
