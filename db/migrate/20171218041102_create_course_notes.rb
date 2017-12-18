class CreateCourseNotes < ActiveRecord::Migration[5.1]
  def change
    create_table :course_notes do |t|
      t.string :title, null: false
      t.string :content, null: false
      t.belongs_to :course, index: true, optional: false
      
      t.timestamps
    end
  end
end
