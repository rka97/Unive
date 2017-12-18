class CreateTeachers < ActiveRecord::Migration[5.1]
  def change
    create_table :teachers do |t|
      t.string :name, null: false
      t.string :title, null: false
      t.date :hiring_date, null: false
      t.references :department, foreign_key: true, optional: false, index: true
      t.timestamps
    end
  end
end
