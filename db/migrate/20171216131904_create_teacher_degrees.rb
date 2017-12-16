class CreateTeacherDegrees < ActiveRecord::Migration[5.1]
  def change
    create_table :teacher_degrees do |t|
      t.string :title, null: false
      t.date :date_awarded, null: false
      t.string :university, null: false
      t.string :field, null: false
      t.references :teacher, foreign_key: true, optional: false, index: true, null: false
      t.timestamps
    end
  end
end
