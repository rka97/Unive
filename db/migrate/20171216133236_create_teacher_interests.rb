class CreateTeacherInterests < ActiveRecord::Migration[5.1]
  def change
    create_table :teacher_interests do |t|
      t.string :field, null: false
      t.belongs_to :teacher, index: true, optional: false
      t.timestamps
    end
  end
end
