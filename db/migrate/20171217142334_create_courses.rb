class CreateCourses < ActiveRecord::Migration[5.1]
  def change
    create_table :courses do |t|
      t.string :code
      t.string :title
      t.integer :credit_hours
      t.integer :total_mark

      t.timestamps
    end
  end
end
