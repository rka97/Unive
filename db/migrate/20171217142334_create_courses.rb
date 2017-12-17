class CreateCourses < ActiveRecord::Migration[5.1]
  def change
    create_table :courses do |t|
      t.string :code, null: false 
      t.string :title, null: false
      t.integer :credit_hours, null: false
      t.integer :total_mark, null: false
      t.belongs_to :department, index: true, optional: false

      t.timestamps
    end
  end
end
