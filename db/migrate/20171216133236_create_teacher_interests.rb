class CreateTeacherInterests < ActiveRecord::Migration[5.1]
  def change
    create_table :teacher_interests do |t|
      t.string :field, null: false
      t.references :teacher, foreign_key: true, optional: false, index: true, null: false
      t.timestamps
    end
  end
end
