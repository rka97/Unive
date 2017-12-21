class CreateStudentTeams < ActiveRecord::Migration[5.1]
  def change
    create_table :student_teams do |t|
      t.references :student
      t.references :team
      t.timestamps
    end
  end
end
