class CreateEnrollments < ActiveRecord::Migration[5.1]
  def change
    create_table :enrollments do |t|
      t.string :degree
      t.belongs_to :student, index: true, optional: false
      t.belongs_to :department, index: true, optional: false
      t.timestamps
    end
  end
end
